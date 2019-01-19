Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E90F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 19 Jan 2019 16:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbfASQ0r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 19 Jan 2019 11:26:47 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:32795 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbfASQ0r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jan 2019 11:26:47 -0500
Received: by mail-qt1-f194.google.com with SMTP id l11so18730055qtp.0
        for <linux-doc@vger.kernel.org>; Sat, 19 Jan 2019 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7OUnerQ4yTyTrQePDak9CT3pVNHgW0ADgz6GmAK0nY4=;
        b=VlT9DB4TMtFUaZbyE8/yG1JgIO29NXxCr5Iu/BUl3VWMppZt8shMSTnCQ1qiPAQSsG
         JMSuYVFIhGigXgJGrrOT0oLnPB7Vzecgsla8xTPP2Yym5P4Zo9JWtuf+v6lZAGv+dOXP
         VH4RRctrV6OAvZPfJYQquA8viJggbwlWLnupo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7OUnerQ4yTyTrQePDak9CT3pVNHgW0ADgz6GmAK0nY4=;
        b=j+5VEAbQDf1uLhYYDVPn1hlAVCWiJuTiAwfb5OQ7c00oeHcLqIGhLRo/G2TGxGEHvh
         BgjPXXQitCtd4r/Ch5hRgeoogoonUB8wX+nwC4Zy10RdVxB1+xnXdoHIa/NvAB33b/OI
         yEwIpx10/7oFg8zpwF14pNixuV2Wtn4QzV4vSBPsle5PcjSOD8FbmjOLsS1sFuP8axgf
         tDMxc+twFyzbVNlKzdGZZnEeaVTUuVV4DBIDcntU5ZV3sfhrqPkMjkLOoqjIyPxNB0Ev
         CPCSj0rBrhgrJ2oM9O2FwF5iUaPbocxaMaJQ33fQ+pb2HkGPpRGnpG6loqISjf5arEH1
         OYcg==
X-Gm-Message-State: AJcUukeStld+G+/b3hANzPNhwH/tuP8GoPhudRxIkJz24lk/TrEwUqqF
        AH2YkqapnUHTnqpkO2uH5HQYPDCinsU=
X-Google-Smtp-Source: ALg8bN4+g8l6SuaVS6iPbHQvFy+/gF9CJpZ1A8TDREyF5KOrq2YpeiAv1XWighDKGdvAwmClnwEnvA==
X-Received: by 2002:ac8:19e2:: with SMTP id s31mr20921029qtk.215.1547915206309;
        Sat, 19 Jan 2019 08:26:46 -0800 (PST)
Received: from localhost ([2620:0:1004:1100:cca9:fccc:8667:9bdc])
        by smtp.gmail.com with ESMTPSA id 70sm15846448qkc.52.2019.01.19.08.26.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Jan 2019 08:26:44 -0800 (PST)
Date:   Sat, 19 Jan 2019 11:26:44 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, ast@kernel.org,
        atishp04@gmail.com, Borislav Petkov <bp@alien8.de>,
        dancol@google.com, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>, Jan Kara <jack@suse.cz>,
        Jonathan Corbet <corbet@lwn.net>, karim.yaghmour@opersys.com,
        Kees Cook <keescook@chromium.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, Manoj Rao <linux@manojrajarao.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        paulmck@linux.vnet.ibm.com,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        rdunlap@infradead.org, rostedt@goodmis.org,
        Thomas Gleixner <tglx@linutronix.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        yhs@fb.com
Subject: Re: [RFC] Provide in-kernel headers for making it easy to extend the
 kernel
Message-ID: <20190119162644.GA231277@google.com>
References: <20190118225543.86996-1-joel@joelfernandes.org>
 <20190119102800.GB17723@infradead.org>
 <20190119103606.GA17400@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190119103606.GA17400@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 19, 2019 at 11:36:06AM +0100, Greg KH wrote:
> On Sat, Jan 19, 2019 at 02:28:00AM -0800, Christoph Hellwig wrote:
> > This seems like a pretty horrible idea and waste of kernel memory.
> 
> It's only a waste if you want it to be a waste, i.e. if you load the
> kernel module.
> 
> This really isn't any different from how /proc/config.gz works.

Yes, that's right, it can be built as a module and loaded and unloaded on
demand to free the kernel memory. Also such a module can be made a part of
the initrd image itself (like other kernel modules that are built into an
initrd), so this solution is already initrd-ready if anyone really wants it
that way.

> > Just add support to kbuild to store a compressed archive in initramfs
> > and unpack it in the right place.
> 
> I think the issue is that some devices do not use initramfs, or switch
> away from it after init happens or something like that.  Joel has all of
> the looney details that he can provide.

Initially I had written this as an image embedded into an init section,
similar to the initramfs. On boot if a boot argument was passed, then the
archive embedded was allocated additional non-init kernel memory to store it for
retrieval through /proc. After that, the image that's embedded would be
dropped entirely as its init memory. If no boot argument was passed, then no
additional memory is used at all. Even though I got that working, I decided
not to go with it because it was clunky because: 1. It required modification
of the linker scripts in the kernel to embed the image into the init section,
and also required a boot argument to be passed which makes the decision on
whether to have headers as a boot-time decision than a post-boot decision.
For these reasons, it is much cleaner to just have a loadable module and make
it on-demand, as I am doing in this patch similar to what /proc/config.gz
does.

thanks!

 - Joel

