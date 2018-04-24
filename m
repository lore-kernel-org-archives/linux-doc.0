Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A8F97DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Apr 2018 06:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755701AbeDXGtE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Apr 2018 02:49:04 -0400
Received: from mail-by2nam01on0082.outbound.protection.outlook.com ([104.47.34.82]:31327
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755603AbeDXGtC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Apr 2018 02:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=O78zi4xfCl4LdQ608aoAjw2nyuArqHZ305V6zqkE3nI=;
 b=b5EB2s51xkyYAi87C6+5y7jtYEWFO9BDgkBJVHouyaqUYFWPs+TzsIzYQGy0RUx1u1g57qdQ/FTfAVJ5OQxOC9ZrMib1OXhIaKXTVPEC2hd3wW3FDsg0Hab2Ux168P7s7oXtO/+GM2veDaP0CMHN23p3/T3uED80UdbKLba1tiQ=
Received: from SN6PR07MB4512.namprd07.prod.outlook.com (52.135.94.11) by
 SN6PR07MB4368.namprd07.prod.outlook.com (52.135.91.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.20.696.13; Tue, 24 Apr 2018 06:48:59 +0000
Received: from SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98]) by SN6PR07MB4512.namprd07.prod.outlook.com
 ([fe80::619b:e1c4:c2d0:7e98%13]) with mapi id 15.20.0696.016; Tue, 24 Apr
 2018 06:48:59 +0000
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
Subject: RE: [RFC 00/10] Adds pcitest tool support for MSI-X
Thread-Topic: [RFC 00/10] Adds pcitest tool support for MSI-X
Thread-Index: AQHT0O90yDxqCBo79kmidlAQjKomXKQPjFig
Date:   Tue, 24 Apr 2018 06:48:59 +0000
Message-ID: <SN6PR07MB45123840F0C9487F1CD119A9D8880@SN6PR07MB4512.namprd07.prod.outlook.com>
References: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
In-Reply-To: <cover.1523379766.git.gustavo.pimentel@synopsys.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYWRvdWdsYXNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04ZjI5YjhiOC00NzhiLTExZTgtODZlNS1mNDk2MzQ4NmY0ZWNcYW1lLXRlc3RcOGYyOWI4YjktNDc4Yi0xMWU4LTg2ZTUtZjQ5NjM0ODZmNGVjYm9keS50eHQiIHN6PSIyNzc5IiB0PSIxMzE2OTAyNjEzNzMwNzEwMzciIGg9InFwa2dGZ05ycnlpcWRpcHBHMUEwWnZCMUo2TT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=adouglas@cadence.com; 
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;SN6PR07MB4368;7:0BU4Bx/FVTwL1Mw/tpAVqOn0p6X75OljcLgRYQn0/kGXXgAtqomDP9OnKKHUZ8qtCVqmwuyQk7jNHhHSuib11XdkjI/HBj92pmByMmXwGfI30etoZ+cgDYbjzhYPH263EbonSX6+OnS+xlEuptC8Nq99Z3HhEi95O+nXAz+ltu9cAJOOGBjNqeTQ6pCC0PcwQuv+FXjmfKY3GCqBukrTHQbLqh0wYZRECetYFkMENCBtASnVP1mJHgwAstDoUc52;20:8BKgDonWIuixRcF629UyMVswpBpXFVcb96hJq40H8r0D7PPbXU6U9hthteB8onNLWlZ5zsVdtMFrE5otuNyjlxhkGINJFLioNpw+AjnzMP505zT7/WTJ0DOlBVDRQeChn6VP/c7hGzO9nFoPh5ihkbozur+DdFxH+2DbgJ2If0sRolQSolwq1SNOkAfJzu90ivcQSBVMV7vLxOmA6B9w2Y7DIBGAAVbQu2IQZJJlEW/bv0QmfWQONuXYMQw6AegC
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);SRVR:SN6PR07MB4368;
x-ms-traffictypediagnostic: SN6PR07MB4368:
x-microsoft-antispam-prvs: <SN6PR07MB436813DDFEE4C7B835C0C344D8880@SN6PR07MB4368.namprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(788757137089);
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231232)(944501410)(52105095)(10201501046)(3002001)(93006095)(93001095)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);SRVR:SN6PR07MB4368;BCL:0;PCL:0;RULEID:;SRVR:SN6PR07MB4368;
x-forefront-prvs: 0652EA5565
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39380400002)(39860400002)(376002)(346002)(396003)(366004)(36092001)(966005)(7736002)(305945005)(7416002)(5660300001)(478600001)(6306002)(316002)(9686003)(6436002)(2501003)(8676002)(4326008)(102836004)(2906002)(8936002)(59450400001)(3280700002)(7696005)(76176011)(3660700001)(81166006)(2201001)(99286004)(11346002)(74316002)(26005)(476003)(229853002)(5250100002)(86362001)(446003)(186003)(53546011)(6506007)(66066001)(14454004)(55016002)(54906003)(6246003)(39060400002)(110136005)(33656002)(3846002)(25786009)(6116002)(53936002)(2900100001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR07MB4368;H:SN6PR07MB4512.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;MLV:ovrnspm;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: cUH9mbRdo8OPpmTcckZJoqYZHggAuMXd5pYi+/peEL2elkmtsWxF7grNSnSOv549Hyo6ECcSm+yOfdBqe0LNAg2o2UeXureAYa35Dt+xgSA5f9KARE9Q6brYO7UHj2ZnFugfR9pbdL5m9qcM2tyUNMUjupqFnzlxNfy3O9seCpkGh+6ENz+bz67O/xoNAREGJx0DGRnHb2eihEPaYTL8JQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 63fde684-5b66-473d-0151-08d5a9af757b
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63fde684-5b66-473d-0151-08d5a9af757b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2018 06:48:59.7534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4368
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Gustavo,

On 10 April 2018 18:15 Gustavo Pimentel wrote:
> This patch set depends the following series:
> https://lkml.org/lkml/2018/4/10/421> This series aims to add pcitest tool=
 support for MSI-X.
>=20
> Includes new callbacks methods and handlers to trigger the MSI-X
> interruptions on the EP Designware IP driver.
>=20
> Provides new methods on pci_epf_test driver that allows to set/get EP
> maximum number of MSI-X entries (similar to set/get MSI methods).
>=20
> Reworks on MSI set/get and triggering methods on EP Designware IP driver =
to
> be more generic and flexible.
>=20
> Adds a new input parameter (msix) and replicates the whole MSI mechanism
> applied to the MSI-X feature on pcitest tool. Also updates the pcitest sc=
ript
> with the new test set applied to this new feature.
>=20
> Gustavo Pimentel (10):
>   PCI: dwc: Add MSI-X callbacks handler
>   PCI: cadence: Update cdns_pcie_ep_raise_irq function signature
>   PCI: endpoint: Add MSI-X interfaces
>   PCI: dwc: MSI callbacks handler rework
>   PCI: dwc: Add legacy interrupt callback handler
>   misc: pci_endpoint_test: Add MSI-X support
>   misc: pci_endpoint_test: Replace lower into upper case characters
>   PCI: endpoint: functions/pci-epf-test: Add MSI-X support
>   PCI: endpoint: functions/pci-epf-test: Replace lower into upper case
>     characters
>   tools: PCI: Add MSI-X support
>=20
>  Documentation/misc-devices/pci-endpoint-test.txt |   3 +
>  drivers/misc/pci_endpoint_test.c                 | 120 ++++++++++----
>  drivers/pci/cadence/pcie-cadence-ep.c            |   2 +-
>  drivers/pci/dwc/pci-dra7xx.c                     |   2 +-
>  drivers/pci/dwc/pcie-artpec6.c                   |   2 +-
>  drivers/pci/dwc/pcie-designware-ep.c             | 201
> +++++++++++++++++++++--
>  drivers/pci/dwc/pcie-designware-plat.c           |   9 +-
>  drivers/pci/dwc/pcie-designware.h                |  40 +++--
>  drivers/pci/endpoint/functions/pci-epf-test.c    | 113 +++++++++----
>  drivers/pci/endpoint/pci-ep-cfs.c                |  24 +++
>  drivers/pci/endpoint/pci-epc-core.c              |  60 ++++++-
>  include/linux/pci-epc.h                          |  11 +-
>  include/linux/pci-epf.h                          |   1 +
>  include/uapi/linux/pcitest.h                     |   1 +
>  tools/pci/pcitest.c                              |  18 +-
>  tools/pci/pcitest.sh                             |  25 +++
>  16 files changed, 528 insertions(+), 104 deletions(-)
>=20
> --
> 2.7.4
>=20
Nice set of patches.  I have tested this with the Cadence EP driver after a=
dding MSI-X support, and found a few changes required.
I will send you comments.

Thanks,
Alan
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
