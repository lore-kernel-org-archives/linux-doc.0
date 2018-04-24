Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E0027DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 11:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755196AbeDXLNC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 07:13:02 -0400
Received: from smtprelay6.synopsys.com ([198.182.37.59]:48972 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754626AbeDXLNB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Apr 2018 07:13:01 -0400
Received: from mailhost.synopsys.com (mailhost2.synopsys.com [10.13.184.66])
        by smtprelay.synopsys.com (Postfix) with ESMTP id CD6431E05E7;
        Tue, 24 Apr 2018 13:12:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1524568380; bh=4x/RlYv/v/dH+im7o0ph4Y2bGgG4nd5k2zJf1wTZLz0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=l02dyPpvnmbzd15qQfkFjiLfl4zgy8vsMZpUBPmIPzTJamddLAY4QrfgKm2HFExt4
         wfN5jwzLcV0wPvTshFDLnhnlhKGfW7qa5knHHYPlQJg849q3vtBekYtbhmQ8sP9ZX3
         tvLLsb/lSSwO5gVbyf5f5gICt2XJwtw6mLT0eRo9+HnaAt9aKOGt7/EtWeCbQYV+YS
         coEBA9+e7hOKMTVxtxMgot4iEex+pHJSCOMbgJbuym4h1dCSiqZVwBUiaNlHS0aGSS
         qgWdSdFKnwetIqNCJiecvZYShVKvqTZPXpiyfgGQtfA5QjBm5iWDpXkNVKbzxsNjPH
         03DCAjGJL+Ixg==
Received: from pt02.synopsys.com (pt02.internal.synopsys.com [10.107.23.240])
        by mailhost.synopsys.com (Postfix) with ESMTP id A5A4E3AF7;
        Tue, 24 Apr 2018 04:12:58 -0700 (PDT)
Received: from [127.0.0.1] (gustavo-e7480.internal.synopsys.com [10.107.25.102])
        by pt02.synopsys.com (Postfix) with ESMTP id C9EEE3ED1E;
        Tue, 24 Apr 2018 12:12:57 +0100 (WEST)
Subject: Re: [RFC 06/10] misc: pci_endpoint_test: Add MSI-X support
To:     Alan Douglas <adouglas@cadence.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
Cc:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <8b88f8c2b766f36c71659deb0fce635154b2b39f.1523379766.git.gustavo.pimentel@synopsys.com>
 <SN6PR07MB45121288F5ACECF3AB3A6D0AD8880@SN6PR07MB4512.namprd07.prod.outlook.com>
From:   Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Message-ID: <237066ef-6049-6f10-698b-9d9878b72291@synopsys.com>
Date:   Tue, 24 Apr 2018 12:11:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <SN6PR07MB45121288F5ACECF3AB3A6D0AD8880@SN6PR07MB4512.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Alan,

On 24/04/2018 07:59, Alan Douglas wrote:
> Hi Gustavo,
> 
> On 10 April 2018 18:15 Gustavo Pimentel wrote:
>>
>> Adds the MSI-X support and updates driver documentation accordingly.
>>
>> Changes the driver parameter in order to allow the interruption type
>> selection.
>>
>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
>> ---
>>  Documentation/misc-devices/pci-endpoint-test.txt |   3 +
>>  drivers/misc/pci_endpoint_test.c                 | 102 +++++++++++++++++------
>>  2 files changed, 79 insertions(+), 26 deletions(-)
>>
>> diff --git a/Documentation/misc-devices/pci-endpoint-test.txt
>> b/Documentation/misc-devices/pci-endpoint-test.txt
>> index 4ebc359..fdfa0f6 100644
>> --- a/Documentation/misc-devices/pci-endpoint-test.txt
>> +++ b/Documentation/misc-devices/pci-endpoint-test.txt
>> @@ -10,6 +10,7 @@ The PCI driver for the test device performs the
>> following tests
>>  	*) verifying addresses programmed in BAR
>>  	*) raise legacy IRQ
>>  	*) raise MSI IRQ
>> +	*) raise MSI-X IRQ
>>  	*) read data
>>  	*) write data
>>  	*) copy data
>> @@ -25,6 +26,8 @@ ioctl
>>   PCITEST_LEGACY_IRQ: Tests legacy IRQ
>>   PCITEST_MSI: Tests message signalled interrupts. The MSI number
>>  	      to be tested should be passed as argument.
>> + PCITEST_MSIX: Tests message signalled interrupts. The MSI-X number
>> +	      to be tested should be passed as argument.
>>   PCITEST_WRITE: Perform write tests. The size of the buffer should be passed
>>  		as argument.
>>   PCITEST_READ: Perform read tests. The size of the buffer should be passed
>> diff --git a/drivers/misc/pci_endpoint_test.c
>> b/drivers/misc/pci_endpoint_test.c
>> index 37db0fc..a7d9354 100644
>> --- a/drivers/misc/pci_endpoint_test.c
>> +++ b/drivers/misc/pci_endpoint_test.c
>> @@ -42,11 +42,16 @@
>>  #define PCI_ENDPOINT_TEST_COMMAND	0x4
>>  #define COMMAND_RAISE_LEGACY_IRQ	BIT(0)
>>  #define COMMAND_RAISE_MSI_IRQ		BIT(1)
>> -#define MSI_NUMBER_SHIFT		2
>> -/* 6 bits for MSI number */
>> -#define COMMAND_READ                    BIT(8)
>> -#define COMMAND_WRITE                   BIT(9)
>> -#define COMMAND_COPY                    BIT(10)
>> +#define COMMAND_RAISE_MSIX_IRQ		BIT(2)
>> +#define IRQ_TYPE_SHIFT			3
>> +#define IRQ_TYPE_LEGACY			0
>> +#define IRQ_TYPE_MSI			1
>> +#define IRQ_TYPE_MSIX			2
>> +#define MSI_NUMBER_SHIFT		5
>> +/* 12 bits for MSI number */
>> +#define COMMAND_READ                    BIT(17)
>> +#define COMMAND_WRITE                   BIT(18)
>> +#define COMMAND_COPY                    BIT(19)
>>
>>  #define PCI_ENDPOINT_TEST_STATUS	0x8
>>  #define STATUS_READ_SUCCESS             BIT(0)
>> @@ -73,9 +78,9 @@ static DEFINE_IDA(pci_endpoint_test_ida);
>>  #define to_endpoint_test(priv) container_of((priv), struct pci_endpoint_test,
>> \
>>  					    miscdev)
>>
>> -static bool no_msi;
>> -module_param(no_msi, bool, 0444);
>> -MODULE_PARM_DESC(no_msi, "Disable MSI interrupt in
>> pci_endpoint_test");
>> +static int irq_type = IRQ_TYPE_MSIX;
>> +module_param(irq_type, int, 0444);
>> +MODULE_PARM_DESC(irq_type, "IRQ mode selection in pci_endpoint_test
>> (0
>> +- Legacy, 1 - MSI, 2 - MSI-X)");
>>
>>  enum pci_barno {
>>  	BAR_0,
>> @@ -103,7 +108,7 @@ struct pci_endpoint_test {  struct
>> pci_endpoint_test_data {
>>  	enum pci_barno test_reg_bar;
>>  	size_t alignment;
>> -	bool no_msi;
>> +	int irq_type;
>>  };
>>
>>  static inline u32 pci_endpoint_test_readl(struct pci_endpoint_test *test,
>> @@ -177,10 +182,10 @@ static bool pci_endpoint_test_bar(struct
>> pci_endpoint_test *test,
>>
>>  static bool pci_endpoint_test_legacy_irq(struct pci_endpoint_test *test)  {
>> -	u32 val;
>> +	u32 val = COMMAND_RAISE_LEGACY_IRQ;
>>
>> -	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
>> -				 COMMAND_RAISE_LEGACY_IRQ);
>> +	val |= (IRQ_TYPE_LEGACY << IRQ_TYPE_SHIFT);
>> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND, val);
>>  	val = wait_for_completion_timeout(&test->irq_raised,
>>  					  msecs_to_jiffies(1000));
>>  	if (!val)
>> @@ -192,12 +197,12 @@ static bool pci_endpoint_test_legacy_irq(struct
>> pci_endpoint_test *test)  static bool pci_endpoint_test_msi_irq(struct
>> pci_endpoint_test *test,
>>  				      u8 msi_num)
>>  {
>> -	u32 val;
>> +	u32 val = COMMAND_RAISE_MSI_IRQ;
>>  	struct pci_dev *pdev = test->pdev;
>>
>> -	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND,
>> -				 msi_num << MSI_NUMBER_SHIFT |
>> -				 COMMAND_RAISE_MSI_IRQ);
>> +	val |= (msi_num << MSI_NUMBER_SHIFT);
>> +	val |= (IRQ_TYPE_MSI << IRQ_TYPE_SHIFT);
>> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND, val);
>>  	val = wait_for_completion_timeout(&test->irq_raised,
>>  					  msecs_to_jiffies(1000));
>>  	if (!val)
>> @@ -209,6 +214,26 @@ static bool pci_endpoint_test_msi_irq(struct
>> pci_endpoint_test *test,
>>  	return false;
>>  }
>>
>> +static bool pci_endpoint_test_msix_irq(struct pci_endpoint_test *test,
>> +				       u16 msix_num)
>> +{
>> +	u32 val = COMMAND_RAISE_MSIX_IRQ;
>> +	struct pci_dev *pdev = test->pdev;
>> +
>> +	val |= (msix_num << MSI_NUMBER_SHIFT);
>> +	val |= (IRQ_TYPE_MSIX << IRQ_TYPE_SHIFT);
>> +	pci_endpoint_test_writel(test, PCI_ENDPOINT_TEST_COMMAND, val);
>> +	val = wait_for_completion_timeout(&test->irq_raised,
>> +					  msecs_to_jiffies(1000));
>> +	if (!val)
>> +		return false;
>> +
>> +	if (test->last_irq - pdev->irq == msix_num - 1)
>> +		return true;
> I think we should use pci_irq_vector() to convert from device vector to Linux IRQ.
> It can be done in pci_endpoint_test_irqhandler()
> (With MSI, pdev->irq will be updated during MSI init, but it is not for MSI-X.)
> 
> pci_irq_vector()  should also be used for devm_request_irq() and devm_free_irq()
> so some changes required in probe and remove.

We could try it, sounds good.
Let's see if Kishon also agrees.

> 
> Regards,
> Alan
> 

Regards,
Gustavo

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
