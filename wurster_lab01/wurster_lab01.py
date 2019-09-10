def main():
	print('\nenter three integers')
	nums = [int(input('num1: ')),
			int(input('num2: ')),
			int(input('num3: '))]
	mean = getMean(sum(nums), len(nums))
	print('The mean of those three was ' + str(mean) + '.\nenter another integer')
	newNum = int(input('num4: '))
	newMean = getMean(mean + newNum, 2)
	print('The mean of ' + str(mean) + ' and ' + str(newNum) + ' was ' + str(newMean) + '.\n')


def getMean(sum, count):
	return float(sum) / count
	

main()