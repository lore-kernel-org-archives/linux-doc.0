Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E0367D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 23 Dec 2018 18:36:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbeLWSgx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 23 Dec 2018 13:36:53 -0500
Received: from a3.inai.de ([88.198.85.195]:44530 "EHLO a3.inai.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbeLWSgw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 23 Dec 2018 13:36:52 -0500
X-Greylist: delayed 564 seconds by postgrey-1.27 at vger.kernel.org; Sun, 23 Dec 2018 13:36:51 EST
Received: by a3.inai.de (Postfix, from userid 25121)
        id 03E8A1FC7D98; Sun, 23 Dec 2018 19:27:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by a3.inai.de (Postfix) with ESMTP id E95543BB8A94;
        Sun, 23 Dec 2018 19:27:22 +0100 (CET)
Date:   Sun, 23 Dec 2018 19:27:22 +0100 (CET)
From:   Jan Engelhardt <jengelh@inai.de>
To:     "Moger, Babu" <Babu.Moger@amd.com>
cc:     "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>, "corbet@lwn.net" <corbet@lwn.net>,
        "fenghua.yu@intel.com" <fenghua.yu@intel.com>,
        "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
        "pombredanne@nexb.com" <pombredanne@nexb.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "qianyue.zj@alibaba-inc.com" <qianyue.zj@alibaba-inc.com>,
        "xiaochen.shen@intel.com" <xiaochen.shen@intel.com>,
        "pbonzini@redhat.com" <pbonzini@redhat.com>,
        "Singh, Brijesh" <brijesh.singh@amd.com>,
        "Hurwitz, Sherry" <sherry.hurwitz@amd.com>,
        "dwmw2@infradead.org" <dwmw2@infradead.org>,
        "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
        "luto@kernel.org" <luto@kernel.org>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "jannh@google.com" <jannh@google.com>,
        "vkuznets@redhat.com" <vkuznets@redhat.com>,
        "rian@alum.mit.edu" <rian@alum.mit.edu>,
        "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v9 00/13] arch/resctrl: AMD QoS support
In-Reply-To: <20181121202811.4492-2-babu.moger@amd.com>
Message-ID: <nycvar.YFH.7.76.1812231909320.1726@n3.vanv.qr>
References: <20181121202811.4492-2-babu.moger@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On Nov 21 2018 20:28:23, Moger, Babu wrote:
>
>This series adds support for AMD64 architectural extensions for 
>Platform Quality of Service.

The term "QoS" is already used for net/sched/. It will be bad naming to 
have QoS - and then an AMD QoS / Platform QoS as well. Preexisting, 
decade-old howtos may speak of enabling "QoS", and with the ambiguity, 
the unsuspecting kernel builder apprentice may enable the wrong thing in 
his config.

So either the QoS from networking gets correspondingly renamed ("packet 
QoS"?.. or something), or else AMD QoS should be changed.
