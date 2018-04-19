Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0854A7DD31
	for <lwn-linux-doc@archive.lwn.net>; Sun, 22 Apr 2018 07:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750826AbeDVHlf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 22 Apr 2018 03:41:35 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46798 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750827AbeDVHle (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Apr 2018 03:41:34 -0400
Received: by mail-wr0-f195.google.com with SMTP id d1-v6so32881472wrj.13
        for <linux-doc@vger.kernel.org>; Sun, 22 Apr 2018 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vaviOjBnACZVehy+k5C6VgaLradD842lXv7spOp0g58=;
        b=Sa0hpjSt/+ppPDqvrYMfCs8aqAP6jcxM7yPquJ45h3lKy1v+3F7WIdKZGSdOtfWMlj
         sy0ckK068o0baEb9Okkr+k7vCpOHA8hPPfVkK514g+679NC0rpumQRE5DJ83IGJ6CcUc
         O9y16jutLKE9XU4FfcOTj30YuTZ+ijJxzKDTH/fluDgp8hvHF4/xjhHUY8QkQ1e1tRsc
         Yyd1NmSOS6JUky6EHHdcyFU01gPOFae9MJQSjDO6mvlOYcn4+WUikNfnLJFOezyx09e4
         bhFZ1qovTtqcAkz3WkU1Z83C7LWiyzXD26XbuQK74gfqIrZN+aXoKnXqBk7lV5EADiWi
         polg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vaviOjBnACZVehy+k5C6VgaLradD842lXv7spOp0g58=;
        b=EcXN+dba+3Oh6kjGqeT/hmpO70HMpVBEdQWLAcCF2L3Uffi1wU0Mku6/XWNfGSThgr
         UrHsdehkOU1RRqKkoPlTEen5O1aaweJYynS6NbnJXHuRp+yeCHYPN98+upITG6CAmUz5
         9aoRDWPzkpZw1hlMSgGssWVQzdOPnRvREG1S0od83UPINTYlFYX5Y4FggDFrwafshGTE
         sPrO7CKHhD1jiT3LufKcbtjO8mp6ls3xvVMrU3gJN2JLwY/McyOs017oBM49LkbfamWz
         ZbKLBfjvsao92mSvR2vp42XCGXKl6P3tHKSmUeCw+Z/r3G3na4sgzCYKFSHM35atEdLJ
         SC3w==
X-Gm-Message-State: ALQs6tAi0QZTOrHmHQcTL1akWrwbgbgoqfGlGFtIOeTdffXzBTKHARCx
        bBTtDODinjMCq5VL6MQtbGLk9A==
X-Google-Smtp-Source: AIpwx484Bcf71W8NdM2Bf7lGg3caJ+L0sJF75/S3PbYDPY6smhsN+Va61OK4+QyttDtZ2C5Nu2JlVw==
X-Received: by 10.80.219.133 with SMTP id p5mr22461269edk.184.1524382893498;
        Sun, 22 Apr 2018 00:41:33 -0700 (PDT)
Received: from node.shutemov.name ([86.57.214.118])
        by smtp.gmail.com with ESMTPSA id t11sm5995328edh.46.2018.04.22.00.41.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Apr 2018 00:41:32 -0700 (PDT)
Received: by node.shutemov.name (Postfix, from userid 1000)
        id 83730648D523; Thu, 19 Apr 2018 12:33:06 +0300 (+03)
Date:   Thu, 19 Apr 2018 12:33:06 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>
Subject: Re: [PATCH 0/6] arm64: untag user pointers passed to the kernel
Message-ID: <20180419093306.rn5bz264nxsn7d7c@node.shutemov.name>
References: <cover.1524077494.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1524077494.git.andreyknvl@google.com>
User-Agent: NeoMutt/20180323
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 18, 2018 at 08:53:09PM +0200, Andrey Konovalov wrote:
> Hi!
> 
> arm64 has a feature called Top Byte Ignore, which allows to embed pointer
> tags into the top byte of each pointer. Userspace programs (such as
> HWASan, a memory debugging tool [1]) might use this feature and pass
> tagged user pointers to the kernel through syscalls or other interfaces.
> 
> This patch makes a few of the kernel interfaces accept tagged user
> pointers. The kernel is already able to handle user faults with tagged
> pointers and has the untagged_addr macro, which this patchset reuses.
> 
> We're not trying to cover all possible ways the kernel accepts user
> pointers in one patchset, so this one should be considered as a start.

How many changes do you anticipate?

This patchset looks small and reasonable, but I see a potential to become a
boilerplate. Would we need to change every driver which implements ioctl()
to strip these bits?

-- 
 Kirill A. Shutemov
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
