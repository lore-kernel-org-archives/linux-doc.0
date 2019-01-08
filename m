Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB46F7D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 Jan 2019 21:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbfAHVDr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 Jan 2019 16:03:47 -0500
Received: from mail-eopbgr700047.outbound.protection.outlook.com ([40.107.70.47]:56032
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728313AbfAHVDr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 Jan 2019 16:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZES6OKWavAeDXGahStW4bE3kSi+y6VsAjBLO+k8zHk=;
 b=arw+5NhjPy9IDMtYxRCao23H8Krl1OvhshOrpR0sRmVS3dfSXUvb34MMnuI9y5whGc3TUklsvVBGg3T4gy0GPpCqXBC24i7fiQANVxhrh6sGgwSyZp0hKc5Yerr4aS9pNBgtw9SRHjRB209EFFmX0+xCVumEtpOPMiKwWlR0apM=
Received: from DM6PR12MB2682.namprd12.prod.outlook.com (20.176.116.31) by
 DM6PR12MB2681.namprd12.prod.outlook.com (20.176.116.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1495.10; Tue, 8 Jan 2019 21:03:44 +0000
Received: from DM6PR12MB2682.namprd12.prod.outlook.com
 ([fe80::10bf:617c:4515:4ad2]) by DM6PR12MB2682.namprd12.prod.outlook.com
 ([fe80::10bf:617c:4515:4ad2%2]) with mapi id 15.20.1495.011; Tue, 8 Jan 2019
 21:03:44 +0000
From:   "Singh, Brijesh" <brijesh.singh@amd.com>
To:     Christophe de Dinechin <dinechin@redhat.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC:     "Singh, Brijesh" <brijesh.singh@amd.com>,
        =?utf-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Eric Skultety <eskultet@redhat.com>,
        "trivial@kernel.org" <trivial@kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/virtual/kvm: Update URL for AMD SEV API
 specification
Thread-Topic: [PATCH] Documentation/virtual/kvm: Update URL for AMD SEV API
 specification
Thread-Index: AQHUprHN158EsZMkgkihpPzb9woqZaWl3eCA
Date:   Tue, 8 Jan 2019 21:03:43 +0000
Message-ID: <821cdac1-b9c5-8f52-780d-18042ad34b13@amd.com>
References: <20190107175238.3026-1-dinechin@redhat.com>
In-Reply-To: <20190107175238.3026-1-dinechin@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:805:3e::36) To DM6PR12MB2682.namprd12.prod.outlook.com
 (2603:10b6:5:4a::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brijesh.singh@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;DM6PR12MB2681;20:5WvMQvcMm24lahVpO+VSVPeI6tvBzhkY2yFOrFCQJxjUsBk9Hg96eQ02iiHWfLG0SbyYHKIqgBs1JHKUjnKMCNejI7PDfPrpI4BKBDSWQDx7MqqZRNoapdXgiy8e4xBjjZleo+dq2jDJDZdr8tWBV7I9o418nRWC0fuIDiCiZEN+LBjiIExPfN5ikFLo43Jw/Jr+/vvNMASezgtqD6RBl/WH1Rp55Nr09hZK4HasKKhL74FKrqgXtuCMiEX6gqFr
x-ms-office365-filtering-correlation-id: e704804c-0275-4b8d-059b-08d675acc5fa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:DM6PR12MB2681;
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-microsoft-antispam-prvs: <DM6PR12MB268191BC76BAF446862FFAD0E58A0@DM6PR12MB2681.namprd12.prod.outlook.com>
x-forefront-prvs: 0911D5CE78
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(376002)(39860400002)(346002)(366004)(189003)(199004)(31696002)(53936002)(14454004)(5660300001)(2616005)(25786009)(476003)(81166006)(71200400001)(4326008)(86362001)(7736002)(54906003)(66066001)(6246003)(81156014)(386003)(76176011)(26005)(186003)(6512007)(71190400001)(105586002)(2501003)(53546011)(6506007)(68736007)(106356001)(102836004)(8936002)(305945005)(6486002)(99286004)(36756003)(97736004)(6436002)(52116002)(558084003)(256004)(229853002)(316002)(31686004)(11346002)(486006)(478600001)(110136005)(446003)(3846002)(6116002)(8676002)(217873002)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB2681;H:DM6PR12MB2682.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hXqy/IpKLpkjKbtotT1Rj3CGUshYwbglBe07D5D5D70CpvPpJHmL876PxEbk4VByG2f7gZivPqhyEsBMKg6Xi/cboY9U/fDKHpiA+X6DuMh/r8/bCrV54QtqPSV7S18eflp7XCBsl+VWXWfjAiSZf1x66zniUYIWuPMRtbVeQvHAGgipQ+T+CL2xrfqzR1cY5zOemZHwlGIcTRTIdX516ZbhzzxxUvURnVlN66+f4LVmhsAVb6/QT1IW+7L2cTGc8GEvBhCJdHFMrjRYHDuoxd+KcTv04OS5to44zhzO2a2wRiwiuQ1+Vbk9m4xr0u3O
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E55FBECB03DE64E9D85A6AE6C23AB0D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e704804c-0275-4b8d-059b-08d675acc5fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2019 21:03:43.9419
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

DQoNCk9uIDEvNy8xOSAxMTo1MiBBTSwgQ2hyaXN0b3BoZSBkZSBEaW5lY2hpbiB3cm90ZToNCj4g
VGhlIFVSTCBvZiBbYXBpLXNwZWNdIGluIERvY3VtZW50YXRpb24vdmlydHVhbC9rdm0vYW1kLW1l
bW9yeS1lbmNyeXB0aW9uLnJzdA0KPiBpcyBubyBsb25nZXIgdmFsaWQsIHJlcGxhY2VkIHNwYWNl
IHdpdGggdW5kZXJzY29yZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgZGUgRGlu
ZWNoaW4gPGRpbmVjaGluQHJlZGhhdC5jb20+DQoNCnRoYW5rcw0KDQpSZXZpZXdlZC1ieTogQnJp
amVzaCBTaW5naCA8YnJpamVzaC5zaW5naEBhbWQuY29tPg0KDQo=
