Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3CB0D7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 24 Aug 2018 11:51:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbeHXP0I (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 24 Aug 2018 11:26:08 -0400
Received: from mail-eopbgr30046.outbound.protection.outlook.com ([40.107.3.46]:63482
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727144AbeHXP0I (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 24 Aug 2018 11:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.onmicrosoft.com;
 s=selector1-cern-ch;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlxCUA4dzVu3XwzvigeZswF0rDA1Nah/QP1qH1yQvpo=;
 b=czsbKtHzcHPcPCOu58KAwaGrcrJeJsnUcoGl0WqhdC7ApsNK4+NnGZIMx7ursvRFbnOFA7y6+p1szF5SrSA8pJaB7Ko6qeJj3m7Q5oO55Uo42NHlnkgQQPXezeWeDXIqJQ9Z20RpMaokZvnlq5scxSogO+dbVc/leuE9LPFACrw=
Received: from DB6PR0601CA0026.eurprd06.prod.outlook.com (2603:10a6:4:17::12)
 by HE1PR0601MB2473.eurprd06.prod.outlook.com (2603:10a6:3:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.15; Fri, 24 Aug
 2018 11:51:34 +0000
Received: from AM5EUR02FT064.eop-EUR02.prod.protection.outlook.com
 (2a01:111:f400:7e1e::208) by DB6PR0601CA0026.outlook.office365.com
 (2603:10a6:4:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1080.15 via Frontend
 Transport; Fri, 24 Aug 2018 11:51:34 +0000
Authentication-Results: spf=pass (sender IP is 188.184.36.48)
 smtp.mailfrom=cern.ch; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=bestguesspass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 188.184.36.48 as permitted sender) receiver=protection.outlook.com;
 client-ip=188.184.36.48; helo=cernmxgwlb4.cern.ch;
Received: from cernmxgwlb4.cern.ch (188.184.36.48) by
 AM5EUR02FT064.mail.protection.outlook.com (10.152.9.51) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
 15.20.1080.9 via Frontend Transport; Fri, 24 Aug 2018 11:51:33 +0000
Received: from cernfe06.cern.ch (188.184.36.49) by cernmxgwlb4.cern.ch
 (188.184.36.48) with Microsoft SMTP Server (TLS) id 14.3.399.0; Fri, 24 Aug
 2018 13:51:17 +0200
Received: from pcbe13614.localnet (2001:1458:202:121::100:40) by smtp.cern.ch
 (2001:1458:201:66::100:14) with Microsoft SMTP Server (TLS) id 14.3.399.0;
 Fri, 24 Aug 2018 13:51:17 +0200
From:   Federico Vaga <federico.vaga@cern.ch>
To:     Jonathan Corbet <corbet@lwn.net>, <amantegazza@vaga.pv.it>
Reply-To: <federico.vaga@cern.ch>
CC:     <linux-doc@vger.kernel.org>
Subject: Italian translations and broken links
Date:   Fri, 24 Aug 2018 13:51:18 +0200
Message-ID: <3898461.lmkq0IsokZ@pcbe13614>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [2001:1458:202:121::100:40]
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:188.184.36.48;IPV:NLI;CTRY:CH;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(438002)(189003)(199004)(74482002)(7736002)(426003)(356003)(305945005)(7636002)(5660300001)(44832011)(50466002)(486006)(476003)(86362001)(126002)(97756001)(4326008)(8676002)(46406003)(47776003)(246002)(33716001)(336012)(186003)(16526019)(43066004)(6116002)(26005)(2906002)(3450700001)(110136005)(23726003)(478600001)(230700001)(9686003)(106002)(8936002)(9576002)(33896004)(786003)(316002)(106466001)(14444005)(39026011);DIR:OUT;SFP:1101;SCL:1;SRVR:HE1PR0601MB2473;H:cernmxgwlb4.cern.ch;FPR:;SPF:Pass;LANG:en;PTR:cernmx12.cern.ch;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bc3a220-ebc7-4b3f-58e4-08d609b7f0ad
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060)(7193020);SRVR:HE1PR0601MB2473;
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2473:
X-Microsoft-Exchange-Diagnostics: 1;HE1PR0601MB2473;20:HikR4Qtvxje2GF0cR+eJy9oIJYqd8tMFFVuKn9IQsbtmbEyIn960mK9f5lKitU49Pd4wCYQ5A/fi2XDFjB5IxKXJhR/ZP90+1BkVcAqRUt9w65+EMtpUAlrYHttnyyNoLgCfilLXfqHFvtu2KGq0E3F2Ydk/Q3w22w3jJDv0nBc07tDmdXVOom6byEALQ6kbOBPFyrIX0YrxcNWimDQsJ0hHmcJIVVkcdMs0LW/FJxk4PrPpN3j3Oj0r5auSFolqcXymnb6g4ruci9v26JsXTbU92OMSpr83sYt9IFjDxDiHyECaMSvExs94AjHDDb7UOHjnXVKq2MsJz1BFq9UjNizeDJnS7qGX1mJLgFABvQq5HUUOAPKk4z0+EjOmchqbaaGCdtFDB1EiAxyMk6dkXiHMC/QQgsevwHPyi0cKvbWVOheC+OaNh+R8kwiAjwtcxXNquEVXiD/uL3A6J9e5o8yIEhuccq0HWs5K0ZRMzoof7gZpSnGY9jxjrQBWcckr;4:kp+rij8HewJwbzHreM/opLnfDfqkiXNyuP18FCWSe+LTaHX+3qjpw7zjQFcY2p0SXRw4ScS0kiHs/VRfRU9KJozLKVI2FSXyzfs/XxLPrdnB4iGPOgpZlpoi7FM1df8pz3JtVEbwHTJ/BxSl8ERYT2KKNgvBisZBVWqpzwdHk9jeLemJR4FQYyFHzJDfebY2R3pqIhtmSCNUunTM722I2GAMLXrmMjfDWLog7MfdERC9pdJSt90JZ1r0RFFgIul9vZV5bvBju8XIL8rCG+GT2w==
X-Microsoft-Antispam-PRVS: <HE1PR0601MB24731540B2E68E10F699BDBAEF360@HE1PR0601MB2473.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231311)(944501410)(52105095)(10201501046)(3002001)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281529075)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699016);SRVR:HE1PR0601MB2473;BCL:0;PCL:0;RULEID:;SRVR:HE1PR0601MB2473;
X-Forefront-PRVS: 07749F8C42
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;HE1PR0601MB2473;23:ibg9cEqhM9MP1lhKgb7gMXqNaavSmXnhCPvcq/X?=
 =?us-ascii?Q?T1nDUNNonjmgT264zq5JATqsXcXiDsQk7x3lSrlzUZGwRw+kXdkarcguBDAQ?=
 =?us-ascii?Q?IQkqKcLIdHItX4wdrOPXfsG4OEocG9YgBKrYAXe6TSVw71Ou497LObUnFlLm?=
 =?us-ascii?Q?8SzUPqsqeEFV6CV6Tcxue95/dEYMCzHnyaxi7jxBhV2w6KUN4YxN484YKlmo?=
 =?us-ascii?Q?X1nzUpy57QuKTvlx49usgNHn1MZfvBoml7nXuBl9KyPLWMroO3fQVNenpV09?=
 =?us-ascii?Q?rzO6wTZDNQMy4jIFEaMaa7NV+ZNn7t3gfXylHd4IrZx7PtvWs+WwN/vfg+2N?=
 =?us-ascii?Q?F+/hxwEK3BvAfCjJBFI3kYOoaB6y80/EG+FyuS1fLpbsbDcsnzYSbnhYvLoy?=
 =?us-ascii?Q?n5AeixIx51OidSLtxH80Ze8tpN51W2TXpXl3GCw4VV3MANmGiH50SKbeGRHZ?=
 =?us-ascii?Q?+R9NkWn8Y32Xh6cFs4kJyLjGpDHubZZVTE1Ivu74+sUt5KwUHJxhF4cc72kt?=
 =?us-ascii?Q?bbB6cKhVho3F1sjH8ruOA/eGnJ8ZONjhofhXTqpsmqWC+q8QkS1l624AODMx?=
 =?us-ascii?Q?SabUl68euo1vK2op/T9gAxzec1TVJo1xVIzSw74StHcRqcpNF9StaIMOw2MU?=
 =?us-ascii?Q?6qOBUnZveQ9nq8gH3gmu8jJM8eVD+LxkWdQYDhOTHu1nmdAg83onleeCfYIe?=
 =?us-ascii?Q?l1KwGjpYdjGKB5swcP5iAPBZ4gjui0Rz3bvurKSrj64OwABl6oeEM9hZfdbd?=
 =?us-ascii?Q?3ShW1if26smCgtJvr9DApUbCkWSC6eKjleGcuIklmPA4dt4d/6wC5UlP192B?=
 =?us-ascii?Q?HX8dBF0erHuoBlziXyveD3+FaJyTPGIbhfobruszANiO3kDpW+Vp043FLUT2?=
 =?us-ascii?Q?4ZwGr7e/X0kpNmJmwS9oLaS81uK2+PImL0WNgDTVNpR7ENUbi6Gni7uzlbe+?=
 =?us-ascii?Q?tdoiaVpraxVPeCDNSCFFi9clE2X3f7ATPQ8AsN5mFU0mkd2qm/qR1XI8/t3U?=
 =?us-ascii?Q?sTvdKc3zioqebf5ylSGsn5WBPo1JGcmcU/a5BFiNaj27yPxPhXPkAKUMQT2m?=
 =?us-ascii?Q?QtdzH01eFNamF75orWDi+2k/UFW3+rUWW88FKhj4yF10Ga5vO9gFJutuBNx3?=
 =?us-ascii?Q?xmBHuL9p1+RE=3D?=
X-Microsoft-Antispam-Message-Info: 6wluN9OKkMS9r2Pbr2XEZbcek5Fgx80FTtzICiKlYQvSti1rTracx4J36DyW2L73SYMQCLIkumf/98SEB81Qd/Rcr/xGWnmxeT9iygTRUA59//NrsUtGhrLWcYwm/opXIWvw0e+Bmkskh/HGFe14liRFPJ7ZaKJgfoEOLnL+P6G1SEzizDxs9uBxibUrHYl3YfAaIxRy+Ac59T29fh132raAXbhR+4bQLLhpxMrMNuy47c6q1CQbyLSbP29xjnpfasXC0Xu0cM1HNBC0N+ASDyvG3YrY1jbFLPZiPj5DnjcIbbkpMexf7u5vWaCWDTdpgu7LqKOWyKNQfP2sDpRH+VQdxmgNBaCts74u/drP+JA=
X-Microsoft-Exchange-Diagnostics: 1;HE1PR0601MB2473;6:7sR/oHMldUaJ0DKCKZKri+PKFzwI6uDCGgkNTwATZLynNtrNNf6O8lkST4qVXAp9N5CgLbID6VTFNToRduFm7IZ4f92P7ka5m8/jqH1bmKyzocU/jasFe6yTmkjdMMG9a3fVY60osqrqUXEkSqmc4OF52AamwzJ7jwU3pWxbHNobATIIUOEgQ5Zxw1x3/amTBjRxoVQ/4iMNT/sjiQqj7ImsZWA39KXmgf2mhbop8fnxDb9yWA/zoBAnhmQEzh4sebJNeuIlN84pTiYJlY0wFlsbdPmS4kOHz57PkphHc/d7QRF/ukPPn/SaRQPiaQw4CQLa8DZu3vdjteuZ3YHXbI1a7ONXA2EPtRxEsRDU5Zd0ZdeYT2cTVRZED9xlR2DRTgOF+1meOpSCd78fVsFnImcxHYY8owyu74bpH3aUt1Y03YYCB2+OzoTM/JBUw2c3yuCjZiMf64yJhW5iqKerOQ==;5:q6RhH/Mzj/CVvBhZkO7GuoppxQ5yIrUF0nbrmrpss/VUM9gj8iXNXKlVcFLHg/oYa8Zn2rnYaKYgNq498qgvVPwLmNCIS2poUbZtjghU4LHdoyckIt8o8VANJ7m09gWi6H2CNw0p2TwRWtTOvMiJ7wfOQ7CHV+blBxPxnO0aZUo=;7:VcskkplZ/Jdqjjpxt7lioK3FDyQLxDip/DKw91V4Tyo95WMFqIPWiP9B570uNtXDqRAJeZZTtoxold+D2X0DkUE6eZSGywf/peYbpwTQK39no1clIQWrgK77t4BZTcnI4y7QotLSvsSV46+Qg1dOLG3llXWQPPaF8FU4sGJZifKr88Tt2lCVZNSr27o3q7r9L+Z7lAly9P1V2L9T8J0DN9wYCLM/hKBHAlOztajv7hzT9VPEwfUH+gRkvs/tEnUk
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2018 11:51:33.8561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc3a220-ebc7-4b3f-58e4-08d609b7f0ad
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[188.184.36.48];Helo=[cernmxgwlb4.cern.ch]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2473
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

just one question about how do you prefer us to proceed. We are translating 
the process directory.
My idea was to complete it and then push it. This because the documents in 
here have links to other documents in the same directory. In order to cleanly 
build it I wanted to translate the full directory and then propose a patch.

Since there are many documents, this take time and perhaps we can already push 
the ones which are ready.

My big dilemma is (which is more general): what about broken references? Do we 
keep broken links which we know they will be correct in the future? Or, do we 
remove all broken links and we add them back only when they work (if we 
remember)?

Thanks :)



