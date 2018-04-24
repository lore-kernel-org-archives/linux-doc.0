Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F34E37DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 09:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754415AbeDXJPU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 05:15:20 -0400
Received: from mail-bl2nam02on0072.outbound.protection.outlook.com ([104.47.38.72]:26541
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755221AbeDXJPD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=HXX7Vnvamnvt5pRVOZHrQ2a0DV54+a5r2fdKUZFKv4s=;
 b=nNiSL11bUSAfb7O0EXn5j7mWGK3/6YS2ihPgehsEj2UmQnNDLOoStVNYnjUopOmSgwXnxzO7+yBXSy4xylog5FV/+oLvPRHA76HXXKsHPHsGinpgt+X0ujcQO/8fu6flHhV+r7wU0sFfpBPOwS/TK3M1FIvgGMPs+eakOoueIrY=
Received: from SN6PR07MB4512.namprd07.prod.outlook.com (52.135.94.11) by
 SN6PR07MB4703.namprd07.prod.outlook.com (52.135.77.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.696.14; Tue, 24 Apr 2018 09:15:00 +0000
Received: from SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98]) by SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98%13]) with mapi id 15.20.0696.016; Tue, 24 Apr
 2018 09:15:00 +0000
From:   Alan Douglas <adouglas@cadence.com>
To:     Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        "bhelgaas@google.com" <bhelgaas@google.com>,
        "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
        "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "kishon@ti.com" <kishon@ti.com>,
        "niklas.cassel@axis.com" <niklas.cassel@axis.com>,
        "jesper.nilsson@axis.com" <jesper.nilsson@axis.com>
CC:     "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 01/10] PCI: dwc: Add MSI-X callbacks handler
Thread-Topic: [RFC 01/10] PCI: dwc: Add MSI-X callbacks handler
Thread-Index: AQHT0O90eZoB3w6tM0iIqeAcoJMN2aQPslLA
Date:   Tue, 24 Apr 2018 09:15:00 +0000
Message-ID: <SN6PR07MB4512414ADA94E98C0E4EA61DD8880@SN6PR07MB4512.namprd07.prod.outlook.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
 <77b7b2687e9618d3f7d1f11c3fc6ecec9a9442ef.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <77b7b2687e9618d3f7d1f11c3fc6ecec9a9442ef.1523379766.git.gustavo.pimentel@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWRvdWdsYXNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1mNzgzMThlOC00NzlmLTExZTgtODZlNS1mNDk2MzQ4NmY0ZWNcYW1lLXRlc3RcZjc4MzE4ZTktNDc5Zi0xMWU4LTg2ZTUtZjQ5NjM0ODZmNGVjYm9keS50eHQiIHN6PSI3MjEyIiB0PSIxMzE2OTAzNDkwMjMwODY3NzQiIGg9IjBDaDFaZlI5QmtyOXlhcVpFNkN6ZXR2dG5xTT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=adouglas@cadence.com; 
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;SN6PR07MB4703;7:grft7CCj0TocV9YyXQ0sgFOUewqTxJ+e4TssUMdPdkHkotgqSJPuQs6YDojNOUDz5LY1dSgJ2zoOuPP9PzaBfO2LbsiqHbM1PW4JmUp1/8n9TqpSzkS4bw1ewm/9kjXr5lgfkwVZ7MwCaik+w1xlDR8RJXnCEfZDnBjMdLD4i1WXrEuzETTdQvZsGBxoC30JGBz2/v5uCbpmYO/wutHUlytIYrbEIfY6hemp9Od4xUKMrq12u7wOEqYrWVEy8jMZ;20:2LM9TucXYILGiAj/R0oJeZnJRZ5W0efbKMmCDnTaLCwzxlWp9SC1fMsC3V5U2frkulCp7qzP2Zk5yTl3qq16y3EU+YbbnQjz8JiG78A2LOP8BBw2GZpb7aCv3lNa6yc8L/+TlsBOsS3UeqTopuIiMhwL6a5WWzdvpUs3tbhJhj13eElsN4HnO04kH3tseh6PriMlqtETQL8PhCryDkwmy+pvOL4/jatxIvLOUPfLUWmP09xe8KWhV2PvFdG+9rg6
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:SN6PR07MB4703;
x-ms-traffictypediagnostic: SN6PR07MB4703:
x-microsoft-antispam-prvs: <SN6PR07MB47037F260C9B9578F2E77D8DD8880@SN6PR07MB4703.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231232)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123560045)(6072148)(201708071742011);SRVR:SN6PR07MB4703;BCL:0;PCL:0;RULEID:;SRVR:SN6PR07MB4703;
x-forefront-prvs: 0652EA5565
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39380400002)(39860400002)(346002)(396003)(366004)(36092001)(14454004)(6436002)(39060400002)(2900100001)(55016002)(53936002)(33656002)(54906003)(478600001)(110136005)(316002)(25786009)(81166006)(8936002)(9686003)(8676002)(2501003)(3846002)(4326008)(7416002)(2201001)(6116002)(5250100002)(3280700002)(76176011)(7696005)(6506007)(59450400001)(2906002)(53546011)(6246003)(74316002)(305945005)(476003)(186003)(3660700001)(86362001)(99286004)(66066001)(26005)(102836004)(7736002)(5660300001)(446003)(11346002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB4703;H:SN6PR07MB4512.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;MLV:ovrnspm;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: 0LCmXpHj319vrr2EWSmtF0S4OOQMpiYXMwazO5bl7xo0LoNszmeYl5+9p312G8ZTwgmlLDK3cgd0lFzDTq3PedHaQGH4papqA8SkfGwE6NUaymvltDrylnbtfBmI8qxLyyzy8Rt8Ilwek/axXIqRE9oOOhLQfUq0XPpI38z0bH9wPpSCRnx+X2aF2i3oyT1MXOQqBKt9YnWWEM5vkDteAQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: a72a0223-a151-4f8c-1762-08d5a9c3db20
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72a0223-a151-4f8c-1762-08d5a9c3db20
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2018 09:15:00.1417
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4703
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 10 April 2018 18:15 Gustavo Pimentel wrote:
> Changes the pcie_raise_irq function signature, namely the interrupt_num
> variable type from u8 to u16 to accommodate the MSI-X maximum interrupts
> of 2048.
>=20
> Implements a PCIe config space capability iterator function to search and=
 save
> the MSI and MSI-X pointers. With this method the code becomes more
> generic and flexible.
>=20
> Implements MSI-X set/get functions for sysfs interface in order to change=
 the
> EP entries number.
>=20
> Implements EP MSI-X interface for triggering interruptions.
>=20
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  drivers/pci/dwc/pci-dra7xx.c           |   2 +-
>  drivers/pci/dwc/pcie-artpec6.c         |   2 +-
>  drivers/pci/dwc/pcie-designware-ep.c   | 145
> ++++++++++++++++++++++++++++++++-
>  drivers/pci/dwc/pcie-designware-plat.c |   6 +-
>  drivers/pci/dwc/pcie-designware.h      |  23 +++++-
>  5 files changed, 173 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/pci/dwc/pci-dra7xx.c b/drivers/pci/dwc/pci-dra7xx.c =
index
> ed8558d..5265725 100644
> --- a/drivers/pci/dwc/pci-dra7xx.c
> +++ b/drivers/pci/dwc/pci-dra7xx.c
> @@ -369,7 +369,7 @@ static void dra7xx_pcie_raise_msi_irq(struct
> dra7xx_pcie *dra7xx,  }
>=20
>  static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				 enum pci_epc_irq_type type, u8
> interrupt_num)
> +				 enum pci_epc_irq_type type, u16
> interrupt_num)
>  {
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>  	struct dra7xx_pcie *dra7xx =3D to_dra7xx_pcie(pci); diff --git
> a/drivers/pci/dwc/pcie-artpec6.c b/drivers/pci/dwc/pcie-artpec6.c index
> e66cede..96dc259 100644
> --- a/drivers/pci/dwc/pcie-artpec6.c
> +++ b/drivers/pci/dwc/pcie-artpec6.c
> @@ -428,7 +428,7 @@ static void artpec6_pcie_ep_init(struct dw_pcie_ep
> *ep)  }
>=20
>  static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> -				  enum pci_epc_irq_type type, u8
> interrupt_num)
> +				  enum pci_epc_irq_type type, u16
> interrupt_num)
>  {
>  	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
>=20
> diff --git a/drivers/pci/dwc/pcie-designware-ep.c b/drivers/pci/dwc/pcie-
> designware-ep.c
> index 15b22a6..874d4c2 100644
> --- a/drivers/pci/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/dwc/pcie-designware-ep.c
> @@ -40,6 +40,44 @@ void dw_pcie_ep_reset_bar(struct dw_pcie *pci,
> enum pci_barno bar)
>  	__dw_pcie_ep_reset_bar(pci, bar, 0);
>  }
>=20
> +void dw_pcie_ep_find_cap_addr(struct dw_pcie_ep *ep) {
> +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	u8 next_ptr, curr_ptr, cap_id;
> +	u16 reg;
> +
> +	memset(&ep->cap_addr, 0, sizeof(ep->cap_addr));
> +
> +	reg =3D dw_pcie_readw_dbi(pci, PCI_STATUS);
> +	if (!(reg & PCI_STATUS_CAP_LIST))
> +		return;
> +
> +	reg =3D dw_pcie_readw_dbi(pci, PCI_CAPABILITY_LIST);
> +	next_ptr =3D (reg & 0x00ff);
> +	if (!next_ptr)
> +		return;
> +
> +	reg =3D dw_pcie_readw_dbi(pci, next_ptr);
> +	curr_ptr =3D next_ptr;
> +	next_ptr =3D (reg & 0xff00) >> 8;
> +	cap_id =3D (reg & 0x00ff);
> +
> +	while (next_ptr && (cap_id <=3D PCI_CAP_ID_MAX)) {
> +		switch (cap_id) {
> +		case PCI_CAP_ID_MSI:
> +			ep->cap_addr.msi_addr =3D curr_ptr;
> +			break;
> +		case PCI_CAP_ID_MSIX:
> +			ep->cap_addr.msix_addr =3D curr_ptr;
> +			break;
> +		}
> +		reg =3D dw_pcie_readw_dbi(pci, next_ptr);
> +		curr_ptr =3D next_ptr;
> +		next_ptr =3D (reg & 0xff00) >> 8;
> +		cap_id =3D (reg & 0x00ff);
> +	}
> +}
> +
>  static int dw_pcie_ep_write_header(struct pci_epc *epc, u8 func_no,
>  				   struct pci_epf_header *hdr)
>  {
> @@ -241,8 +279,47 @@ static int dw_pcie_ep_set_msi(struct pci_epc *epc,
> u8 func_no, u8 encode_int)
>  	return 0;
>  }
>=20
> +static int dw_pcie_ep_get_msix(struct pci_epc *epc, u8 func_no) {
> +	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
> +
> +	if (ep->cap_addr.msix_addr =3D=3D 0)
> +		return 0;
> +
> +	reg =3D ep->cap_addr.msix_addr + PCI_MSIX_FLAGS;
> +	val =3D dw_pcie_readw_dbi(pci, reg);
> +	if (!(val & PCI_MSIX_FLAGS_ENABLE))
> +		return -EINVAL;
> +
> +	val &=3D PCI_MSIX_FLAGS_QSIZE;
> +
> +	return val;
> +}
> +
> +static int dw_pcie_ep_set_msix(struct pci_epc *epc, u8 func_no, u16
> +interrupts) {
> +	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
> +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	u32 val, reg;
> +
> +	if (ep->cap_addr.msix_addr =3D=3D 0)
> +		return 0;
> +
> +	reg =3D ep->cap_addr.msix_addr + PCI_MSIX_FLAGS;
> +	val =3D dw_pcie_readw_dbi(pci, reg);
> +	val &=3D ~PCI_MSIX_FLAGS_QSIZE;
> +	val |=3D interrupts;
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, reg, val);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	return 0;
> +}
> +
>  static int dw_pcie_ep_raise_irq(struct pci_epc *epc, u8 func_no,
> -				enum pci_epc_irq_type type, u8
> interrupt_num)
> +				enum pci_epc_irq_type type, u16
> interrupt_num)
>  {
>  	struct dw_pcie_ep *ep =3D epc_get_drvdata(epc);
>=20
> @@ -282,6 +359,8 @@ static const struct pci_epc_ops epc_ops =3D {
>  	.unmap_addr		=3D dw_pcie_ep_unmap_addr,
>  	.set_msi		=3D dw_pcie_ep_set_msi,
>  	.get_msi		=3D dw_pcie_ep_get_msi,
> +	.set_msix		=3D dw_pcie_ep_set_msix,
> +	.get_msix		=3D dw_pcie_ep_get_msix,
>  	.raise_irq		=3D dw_pcie_ep_raise_irq,
>  	.start			=3D dw_pcie_ep_start,
>  	.stop			=3D dw_pcie_ep_stop,
> @@ -322,6 +401,60 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep
> *ep, u8 func_no,
>  	return 0;
>  }
>=20
> +int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> +			     u16 interrupt_num)
> +{
> +	struct dw_pcie *pci =3D to_dw_pcie_from_ep(ep);
> +	struct pci_epc *epc =3D ep->epc;
> +	u16 tbl_offset, bir;
> +	u32 bar_addr_upper, bar_addr_lower;
> +	u32 msg_addr_upper, msg_addr_lower;
> +	u32 reg, msg_data;
> +	u64 tbl_addr, msg_addr, reg_u64;
> +	void __iomem *msix_tbl;
> +	int ret;
> +
> +	reg =3D ep->cap_addr.msix_addr + PCI_MSIX_TABLE;
> +	tbl_offset =3D dw_pcie_readl_dbi(pci, reg);
> +	bir =3D (tbl_offset & PCI_MSIX_TABLE_BIR);
> +	tbl_offset &=3D PCI_MSIX_TABLE_OFFSET;
> +	tbl_offset >>=3D 3;
> +
> +	reg =3D PCI_BASE_ADDRESS_0 + (4 * bir);
> +	bar_addr_lower =3D dw_pcie_readl_dbi(pci, reg);
> +	reg_u64 =3D (bar_addr_lower & PCI_BASE_ADDRESS_MEM_TYPE_MASK);
> +	if (reg_u64 =3D=3D PCI_BASE_ADDRESS_MEM_TYPE_64)
> +		bar_addr_upper =3D dw_pcie_readl_dbi(pci, reg + 4);
> +	else
> +		bar_addr_upper =3D 0;
> +
> +	tbl_addr =3D ((u64) bar_addr_upper) << 32 | bar_addr_lower;
> +	tbl_addr +=3D (tbl_offset + ((interrupt_num - 1) * PCI_MSIX_ENTRY_SIZE)=
);
> +	tbl_addr &=3D PCI_BASE_ADDRESS_MEM_MASK;
> +
> +	msix_tbl =3D ioremap_nocache(ep->phys_base + tbl_addr, ep->addr_size);
> +	if (!msix_tbl)
> +		return -EINVAL;
> +
I think you need to check the mask bit in  vector control for the requested=
 IRQ.
You could set the pending bit if masked, but would then need some output=20
signal to inform when the mask bit is cleared (or poll it) so the message c=
an be sent
later.

Also, do you need to check PCI_MSIX_FLAGS_ENABLE here as well, or is it che=
cked earlier?

Regards,
Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
