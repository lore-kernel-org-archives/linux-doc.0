Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6A9DA7E66E
	for <lwn-linux-doc@archive.lwn.net>; Sun, 18 Mar 2018 15:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751061AbeCRPJF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 18 Mar 2018 11:09:05 -0400
Received: from shards.monkeyblade.net ([184.105.139.130]:56614 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751062AbeCRPJE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Mar 2018 11:09:04 -0400
Received: from localhost (pool-173-77-163-229.nycmny.fios.verizon.net [173.77.163.229])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 8DF7710208B6B;
        Sun, 18 Mar 2018 08:08:59 -0700 (PDT)
Date:   Sun, 18 Mar 2018 11:08:57 -0400 (EDT)
Message-Id: <20180318.110857.1660518649370410007.davem@davemloft.net>
To:     khalid.aziz@oracle.com
Cc:     dave.hansen@linux.intel.com, aarcange@redhat.com,
        akpm@linux-foundation.org, allen.pais@oracle.com,
        aneesh.kumar@linux.vnet.ibm.com, anthony.yznaga@oracle.com,
        arnd@arndb.de, benh@kernel.crashing.org, bob.picco@oracle.com,
        bsingharora@gmail.com, corbet@lwn.net, dan.j.williams@intel.com,
        dave.jiang@intel.com, david.j.aldridge@oracle.com,
        dwindsor@gmail.com, ebiederm@xmission.com,
        elena.reshetova@intel.com, gregkh@linuxfoundation.org,
        hannes@cmpxchg.org, henry.willard@oracle.com, hpa@zytor.com,
        hughd@google.com, imbrenda@linux.vnet.ibm.com, jack@suse.cz,
        jag.raman@oracle.com, jane.chu@oracle.com, jglisse@redhat.com,
        jroedel@suse.de, khalid@gonehiking.org,
        khandual@linux.vnet.ibm.com, kirill.shutemov@linux.intel.com,
        kstewart@linuxfoundation.org, ktkhai@virtuozzo.com,
        liam.merwick@oracle.com, linux-arch@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
        linuxram@us.ibm.com, linux@roeck-us.net, me@tobin.cc,
        mgorman@suse.de, mgorman@techsingularity.net, mhocko@suse.com,
        mike.kravetz@oracle.com, minchan@kernel.org, mingo@kernel.org
Subject: Re: [PATCH v12 00/11] Application Data Integrity feature
 introduced by SPARC M7
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cover.1519227112.git.khalid.aziz@oracle.com>
References: <cover.1519227112.git.khalid.aziz@oracle.com>
X-Mailer: Mew version 6.7 on Emacs 25.3 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 18 Mar 2018 08:09:02 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Khalid Aziz <khalid.aziz@oracle.com>
Date: Wed, 21 Feb 2018 10:15:42 -0700

> V12 changes:
> This series is same as v10 and v11 and was simply rebased on 4.16-rc2
> kernel and patch 11 was added to update signal delivery code to use the
> new helper functions added by Eric Biederman. Can mm maintainers please
> review patches 2, 7, 8 and 9 which are arch independent, and
> include/linux/mm.h and mm/ksm.c changes in patch 10 and ack these if
> everything looks good? 

Khalid I've applied this series to sparc-next, thank you!

But one thing has to be fixed up.

In uapi/asm/auxvec.h you conditionalize the ADI aux vectors on
CONFIG_SPARC64.

That's not correct, you should never control user facing definitions
based upon kernel configuration.

Also, both 32-bit and 64-bit applications running on ADI capable
machines want to compile against and use this informaiton.

So please remove these CPP checks.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
