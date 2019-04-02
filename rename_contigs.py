import argparse
import sys
from Bio import SeqIO


def main():
    # parse args
    parser = argparse.ArgumentParser(description="Renames paired read/contigs")
    parser.add_argument("fasta", metavar="FASTA", help="FASTA file")
    args = parser.parse_args()
    # central dispatch
    previous_seq_record = None
    for seq_record in SeqIO.parse(args.fasta, "fasta"):
        if not previous_seq_record:
            previous_seq_record = seq_record
            continue
        if previous_seq_record.id == seq_record.id:
            previous_seq_record.id = previous_seq_record.id + "/1"
            seq_record.id = seq_record.id + "/2"
        SeqIO.write(previous_seq_record, sys.stdout, "fasta")
        previous_seq_record = seq_record
    SeqIO.write(seq_record, sys.stdout, "fasta")


if __name__ == "__main__":
    main()
