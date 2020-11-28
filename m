Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8D3C8301B
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B480522268
	for <linux-doc@archiver.kernel.org>; Sat, 28 Nov 2020 22:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=windriversystems.onmicrosoft.com header.i=@windriversystems.onmicrosoft.com header.b="oB/W115F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388347AbgK1Vtg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:36 -0500
Received: from mail-bn7nam10on2063.outbound.protection.outlook.com ([40.107.92.63]:8417
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387709AbgK1UeJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 28 Nov 2020 15:34:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZr9WpxloMtPjUzvXW9K0Kb6x0j+Mr0hnauBxkyXVDAYje/Apy6XbfnFaxLPRGXIG/xeDzjxQxhVibwL17EcIqT8DBtS/FGngE5RVCnnG9spaQLnWBE++WxHcALMnRtPjDV6cx0f25Om1lIzBMBtICl6Rn5svdwASl7TYVrq9FFQ5Vyh6sk1PwhsKVHin3hIWOQw6sH0pt0+AAg6ntQm4XmpsaSAle9T7uJASujGR/zlfL2XgAOSL0nKAjBw4nhSg/cO0Y8+iRr/O8CPYeXQi1AH+h0RSMlljparl9in5LZi+2FJk//dpb7AHblfsJkp2R338h647hxe87gTtSrwNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I78d4yZhopkaB6UxdTh0WuAo8NAjuECOrdwoWxealk4=;
 b=ZoCpyCZOxGbFe0XnOJf04EXxvZm4d5yBFyi5ruDVySq8WQ55hzDnk6kLtUppEcK8hBdp8LEVUGAIScBWuYXOJ01DUAU9D1+TbYLsdaK67uuadUCre4MPyJjMo28OuQPbQAkvXpIjgTvh9vxvS52+CD/l7tHJBH1VyVz7JdaCt9B8RarCoV3J79TLEKmlqTx15HEHz3jOwpHzWjH6dOdqzhYfw25QXuF/fai2w+cl4h+gJgAtAgQDUe2UsnlQdoEvSBl7u4mlcoPj7act+4TKhrVGgYdIJr1yY405DamzaQSOjCFQxuiUys3mcMAR7+wAPebaZhDmphOyH4S72dzmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I78d4yZhopkaB6UxdTh0WuAo8NAjuECOrdwoWxealk4=;
 b=oB/W115FJfefOxVXOBbJ4fVA/OtcBnmjzAAmYV1WTa26s/6M0o6c7ucLDm4M5X/UfjdE89dpv80bubDRnA5teiHdkm2EQSTcEA5ICMjtKS8aSB6RuQVJmXalEUBRsnsMKh5K6uXj83QRRB5B4rjqpnnrdyJnjifgKujuLE8r9wE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM5PR11MB1626.namprd11.prod.outlook.com (2603:10b6:4:9::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Sat, 28 Nov 2020 20:33:19 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::4985:c74a:ffcb:6f40%4]) with mapi id 15.20.3611.025; Sat, 28 Nov 2020
 20:33:18 +0000
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-doc@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Opdenacker <michael.opdenacker@free-electrons.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: [PATCH v2] docs: fix typos and drop/fix dead links in RCU documentation
Date:   Sat, 28 Nov 2020 15:32:59 -0500
Message-Id: <20201128203259.74063-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201128145538.69468-1-paul.gortmaker@windriver.com>
References: <20201128145538.69468-1-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::27) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sc2600cp.corp.ad.wrs.com (128.224.252.2) by YT1PR01CA0118.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend Transport; Sat, 28 Nov 2020 20:33:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5f395a-e591-4c5d-45c3-08d893dcd707
X-MS-TrafficTypeDiagnostic: DM5PR11MB1626:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB162642A12B08E64929AAC3FA83F70@DM5PR11MB1626.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +yopoyREEQASH7Fmc8NW3aYmVwclX5U5GjGC44Eicb+uT+zskkpNwPugQOTMGWfk5na60FZvPPG3bk7P0rTzuWTcVl+0PdaI9t56AivC1uD0RCHOQouJvQZ+3z7J97yJaGiWUCcEHHVYCy88HmVF+cVb2YFMJ5QtI8thyxVED9qGua/tlJ361y+RWr4ddQ5e2ucKldECRn0RE7FAv/j+IRD1cgroek7cTQ53mNMShTgeDCJi9PwqV5Ghq30MXl6FhVw2t6KLeavUECeQY/OKFZb54OqB9I/mCtRhCqizv5pjqDobY3N9qFyWOjhzChuTOyFzJwZhklUdzqpIPOqd/1SqB98RzcpwV6GsaPwriqol71ikwAZ/v1MWxZ9ZzXm5lAyf7loDROWBct9egwh8iA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(346002)(376002)(136003)(6666004)(6506007)(1076003)(26005)(4326008)(16526019)(478600001)(36756003)(186003)(86362001)(5660300002)(2906002)(52116002)(44832011)(966005)(8676002)(83380400001)(6486002)(6512007)(66556008)(8936002)(66476007)(6916009)(316002)(66946007)(2616005)(54906003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXdvOFVFTXl6RWl1cEV4czNvVU5OLzkyT2N6RjVPVW5jOGtUYkh4UXZYdW1F?=
 =?utf-8?B?QmNvc1l3b1pFeDRSSS96NWp5Y0pUVTZpOVpNaGhFdlBBYmg4T0Q1VUlGb1Fm?=
 =?utf-8?B?ZjlkMldvRk1HQVVkUVlHL1o2NlNoVzNsT1JyTmlFNmIwc0wvZFpvNDFvTVRO?=
 =?utf-8?B?bFlVeHhvWlVFUHZIWDVnZVlGTWoxaXVDQW5XUnBTVDNoOFh0WERTSVBGSklK?=
 =?utf-8?B?Ni9vdjJHbHZ3OVlCNGRTQlY4Y2JNNmV5aGtlRDBNeVltRm01VDI0Z3RCaHVr?=
 =?utf-8?B?VlJ2RnplS2tJL0FnMXQwWllpZFJEdkk1UWFwZFpyelMzTWQxMksvaUl6RmFV?=
 =?utf-8?B?ZXBSY1JEWTMvRlhWcXJJdUdwTTkzVnZRcERGTFliNXVqUjM2a2NYTXdsTmdC?=
 =?utf-8?B?U1M5Sy9GWnZCTFpBU1JKbnVJRWpBU3FLVU9Qbnl6N0xKaHk0T1ZnUVpnVTky?=
 =?utf-8?B?TTN5L29oaHFIS2tNa1FEVDJzdURERENyL1JDRVBpUk8remxIQ0FaZDdFcE9x?=
 =?utf-8?B?ekhYZ3AxMGF6dHNVZ3BpTVZWN3RLbjIxK0c0NjEwN2dIaHZYVTZDakVvSUxw?=
 =?utf-8?B?eWxPaitweFVVVHRJOWlTbEdYNTRSdFMwQy9WYkJYWVNHajVZTGJXNGxJSWlp?=
 =?utf-8?B?QXlQTmYrbmxEbzRMaTdVcU9rK2N0Ui9HRkVHK1F0OVFEQTkrMDZEekJtNjdP?=
 =?utf-8?B?bFBUOTBhNlMvZnFnbFVDeXNZWVBOaDl5QWZrVHZOT1gwRy9iMnZlYmlMS0Fh?=
 =?utf-8?B?TjNpTW9UK2tKQ2tkUGVpcDhqT2JFODZpSHc3M1JyZW1Oc05SWmlWSVJHL2ZN?=
 =?utf-8?B?cmJxNUo2aUkyd2hOZExaQ1JKa2FrSzkzQ1V5UWN5RjNUY0d1ZVFmdWx0bmNh?=
 =?utf-8?B?VHZaNDVxelZINTdacjdQa2cvOEIvcXhkazl1VGxkYit0OThuQjZOaXVrNUE4?=
 =?utf-8?B?dlNLbEVyZFhYcllXMDcveVh2QzBxdjlaVFZFMmN3Vi9aNmducVR4cFg5bkV2?=
 =?utf-8?B?OFNDaURFanVTMXVxcis4SEVTS2pFUTZlOGt5cURlWkJUN1FlbmFzTmZHeFpQ?=
 =?utf-8?B?dW4vRU1yN3R3ZmNTVE9hb3lxdFMvUnNOa1RqZ0c2T3ZSY05PV1RtWkVrazZj?=
 =?utf-8?B?L1d0Wi9lMERveXZiM3FDbHM3OXNoVnJhV1M1aGJ5clRvWlp0dGlQd0ZUVlhz?=
 =?utf-8?B?Tng1SC9nZmZBKzcyWlYzTUdaZ3ZlYkJsRXF4RkVBbkpVendGZzh5K0ZYYU91?=
 =?utf-8?B?SW1wZnlyRHZob042SENDRjNFbEpadGhseU15ajlRdG83WC9oS1l3WXQ1WW5o?=
 =?utf-8?Q?z10TjBTQ9/naxTRNOYB9robnEkz5oZOnZY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5f395a-e591-4c5d-45c3-08d893dcd707
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2020 20:33:18.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /kakOYSA3HzotgBuOEnBRvDtW7DoAsBpo1MnE01FLSj0Lk+ybUC9UuQ8u81nfFxkCGlKfQ/CfoJh+ImlU6X/dXqPH/n4indh3LrmXht1+u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1626
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It appears the Compaq link moved to a machine at HP for a while
after the merger of the two, but that doesn't work either.  A search
of HP for "wiz_2637" (w and w/o html suffix) comes up empty.

Since the references aren't critical to the documents we remove them.

Also, the lkml.kernel.org/g links have been broken for ages, so replace
them with lore.kernel.org/r links - standardize on lore for all links too.

Note that we put off fixing these 4y ago - presumably thinking that a
treewide fixup was pending.  Probably safe to go fix the RCU ones now.

https://lore.kernel.org/r/20160915144926.GD10850@linux.vnet.ibm.com/

Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---

[v2: 2nd dead Alpha link found; also fixup the lkml --> lore links.]

 .../RCU/Design/Requirements/Requirements.rst  | 23 +++++++++----------
 Documentation/RCU/checklist.rst               |  8 +++----
 2 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/Documentation/RCU/Design/Requirements/Requirements.rst b/Documentation/RCU/Design/Requirements/Requirements.rst
index 2dce79dd0eaa..4ff0f4506fbf 100644
--- a/Documentation/RCU/Design/Requirements/Requirements.rst
+++ b/Documentation/RCU/Design/Requirements/Requirements.rst
@@ -321,11 +321,10 @@ do_something_gp_buggy() below:
       12 }
 
 However, this temptation must be resisted because there are a
-surprisingly large number of ways that the compiler (to say nothing of
-`DEC Alpha CPUs <https://h71000.www7.hp.com/wizard/wiz_2637.html>`__)
-can trip this code up. For but one example, if the compiler were short
-of registers, it might choose to refetch from ``gp`` rather than keeping
-a separate copy in ``p`` as follows:
+surprisingly large number of ways that the compiler (or weak ordering
+CPUs like the DEC Alpha) can trip this code up. For but one example, if
+the compiler were short of registers, it might choose to refetch from
+``gp`` rather than keeping a separate copy in ``p`` as follows:
 
    ::
 
@@ -1183,7 +1182,7 @@ costs have plummeted. However, as I learned from Matt Mackall's
 `bloatwatch <http://elinux.org/Linux_Tiny-FAQ>`__ efforts, memory
 footprint is critically important on single-CPU systems with
 non-preemptible (``CONFIG_PREEMPT=n``) kernels, and thus `tiny
-RCU <https://lkml.kernel.org/g/20090113221724.GA15307@linux.vnet.ibm.com>`__
+RCU <https://lore.kernel.org/r/20090113221724.GA15307@linux.vnet.ibm.com>`__
 was born. Josh Triplett has since taken over the small-memory banner
 with his `Linux kernel tinification <https://tiny.wiki.kernel.org/>`__
 project, which resulted in `SRCU <#Sleepable%20RCU>`__ becoming optional
@@ -1624,7 +1623,7 @@ against mishaps and misuse:
    init_rcu_head() and cleaned up with destroy_rcu_head().
    Mathieu Desnoyers made me aware of this requirement, and also
    supplied the needed
-   `patch <https://lkml.kernel.org/g/20100319013024.GA28456@Krystal>`__.
+   `patch <https://lore.kernel.org/r/20100319013024.GA28456@Krystal>`__.
 #. An infinite loop in an RCU read-side critical section will eventually
    trigger an RCU CPU stall warning splat, with the duration of
    “eventually” being controlled by the ``RCU_CPU_STALL_TIMEOUT``
@@ -1716,7 +1715,7 @@ requires almost all of them be hidden behind a ``CONFIG_RCU_EXPERT``
 
 This all should be quite obvious, but the fact remains that Linus
 Torvalds recently had to
-`remind <https://lkml.kernel.org/g/CA+55aFy4wcCwaL4okTs8wXhGZ5h-ibecy_Meg9C4MNQrUnwMcg@mail.gmail.com>`__
+`remind <https://lore.kernel.org/r/CA+55aFy4wcCwaL4okTs8wXhGZ5h-ibecy_Meg9C4MNQrUnwMcg@mail.gmail.com>`__
 me of this requirement.
 
 Firmware Interface
@@ -1837,9 +1836,9 @@ NMI handlers.
 
 The name notwithstanding, some Linux-kernel architectures can have
 nested NMIs, which RCU must handle correctly. Andy Lutomirski `surprised
-me <https://lkml.kernel.org/r/CALCETrXLq1y7e_dKFPgou-FKHB6Pu-r8+t-6Ds+8=va7anBWDA@mail.gmail.com>`__
+me <https://lore.kernel.org/r/CALCETrXLq1y7e_dKFPgou-FKHB6Pu-r8+t-6Ds+8=va7anBWDA@mail.gmail.com>`__
 with this requirement; he also kindly surprised me with `an
-algorithm <https://lkml.kernel.org/r/CALCETrXSY9JpW3uE6H8WYk81sg56qasA2aqmjMPsq5dOtzso=g@mail.gmail.com>`__
+algorithm <https://lore.kernel.org/r/CALCETrXSY9JpW3uE6H8WYk81sg56qasA2aqmjMPsq5dOtzso=g@mail.gmail.com>`__
 that meets this requirement.
 
 Furthermore, NMI handlers can be interrupted by what appear to RCU to be
@@ -2264,7 +2263,7 @@ more extreme measures. Returning to the ``page`` structure, the
 ``rcu_head`` field shares storage with a great many other structures
 that are used at various points in the corresponding page's lifetime. In
 order to correctly resolve certain `race
-conditions <https://lkml.kernel.org/g/1439976106-137226-1-git-send-email-kirill.shutemov@linux.intel.com>`__,
+conditions <https://lore.kernel.org/r/1439976106-137226-1-git-send-email-kirill.shutemov@linux.intel.com>`__,
 the Linux kernel's memory-management subsystem needs a particular bit to
 remain zero during all phases of grace-period processing, and that bit
 happens to map to the bottom bit of the ``rcu_head`` structure's
@@ -2328,7 +2327,7 @@ preempted. This requirement made its presence known after users made it
 clear that an earlier `real-time
 patch <https://lwn.net/Articles/107930/>`__ did not meet their needs, in
 conjunction with some `RCU
-issues <https://lkml.kernel.org/g/20050318002026.GA2693@us.ibm.com>`__
+issues <https://lore.kernel.org/r/20050318002026.GA2693@us.ibm.com>`__
 encountered by a very early version of the -rt patchset.
 
 In addition, RCU must make do with a sub-100-microsecond real-time
diff --git a/Documentation/RCU/checklist.rst b/Documentation/RCU/checklist.rst
index bb7128eb322e..2d1dc1deffc9 100644
--- a/Documentation/RCU/checklist.rst
+++ b/Documentation/RCU/checklist.rst
@@ -70,7 +70,7 @@ over a rather long period of time, but improvements are always welcome!
 	is less readable and prevents lockdep from detecting locking issues.
 
 	Letting RCU-protected pointers "leak" out of an RCU read-side
-	critical section is every bid as bad as letting them leak out
+	critical section is every bit as bad as letting them leak out
 	from under a lock.  Unless, of course, you have arranged some
 	other means of protection, such as a lock or a reference count
 	-before- letting them out of the RCU read-side critical section.
@@ -129,9 +129,7 @@ over a rather long period of time, but improvements are always welcome!
 		accesses.  The rcu_dereference() primitive ensures that
 		the CPU picks up the pointer before it picks up the data
 		that the pointer points to.  This really is necessary
-		on Alpha CPUs.	If you don't believe me, see:
-
-			http://www.openvms.compaq.com/wizard/wiz_2637.html
+		on Alpha CPUs.
 
 		The rcu_dereference() primitive is also an excellent
 		documentation aid, letting the person reading the
@@ -216,7 +214,7 @@ over a rather long period of time, but improvements are always welcome!
 7.	As of v4.20, a given kernel implements only one RCU flavor,
 	which is RCU-sched for PREEMPT=n and RCU-preempt for PREEMPT=y.
 	If the updater uses call_rcu() or synchronize_rcu(),
-	then the corresponding readers my use rcu_read_lock() and
+	then the corresponding readers may use rcu_read_lock() and
 	rcu_read_unlock(), rcu_read_lock_bh() and rcu_read_unlock_bh(),
 	or any pair of primitives that disables and re-enables preemption,
 	for example, rcu_read_lock_sched() and rcu_read_unlock_sched().
-- 
2.17.1

