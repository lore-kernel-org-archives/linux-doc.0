Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67CDCD37B0
	for <linux-doc@archiver.kernel.org>; Mon, 18 Sep 2023 08:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233174AbjIRIyo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Sep 2023 04:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240854AbjIRIy2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Sep 2023 04:54:28 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88300D1
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 01:54:21 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-65637f0d10eso10516736d6.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Sep 2023 01:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695027260; x=1695632060; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ClIL0dCrkOnBpg+a8Xrgg6ALAEbCrlXjT2IySqiHtKo=;
        b=u8ZD/tLHkghAHL1x3Z5csY7TS0x+qzQBg7+JO2T+rrz2vxZXX4PdG/WowjG1wbpgOP
         EusnK1jwBMoUINUZta0mngSq9MY0J//NmAKyhKIX9pVWBG+PTWWYoiLbbpSmihtS0GzF
         BT9SfrwL5Y9KOnuNVtaa+YwNOlygraUVVApm1shy2+Z3NOiM0rcPwCDJyB6vz/gDvDlg
         8U48mjZrPdBzKSHdIVAvmK7CrMTwww2nRKSP4D29OrMrWAq1BAN5HfZfIASoQFwR/AeR
         490YwGdMJLfLzVg9F32eA8uIoHaqZLK8edaawRMrYXEKj5Z7xT8iUe0KqCb2pghVZ4Za
         iWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695027260; x=1695632060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClIL0dCrkOnBpg+a8Xrgg6ALAEbCrlXjT2IySqiHtKo=;
        b=JXKDCTk/RLI7QgaRd8evfjdp5lrqM8CWBRdysi+9Vm09pf9BPBQbevRgYTqjmDKgxa
         SAnwPmRmwxnxLpFxb2cO8nJOJllnID6R4VAe5lNM5Yl0D0DU686yRFmUA4vy/G09Kh6U
         GeutJHMf80QCSBA8LYfP6OHtlKquqtEMcobUQnfW/WzQnQyE6hAl0xa5LsgQ2RAmk4aT
         nEBBuikMXKlhJRS+01jsMev6wNTwgxb+Qkhxb48335Jl3ah2QwNTAXxnIdJU9yRXnT0b
         XWookVmfB1X89wgoF8IwVYsaNn9hsYrWhg2mAFadvUfq+bjlgcFWa3l0Ut5l0FCLc2xF
         ncuA==
X-Gm-Message-State: AOJu0Ywy9zVykTtvfc8YkFJ35pRkXTzlqHYQ3oI+nGN7Cs+gvM1V8v31
        4FzXTNeXWMUqKRZPOe/BjboxsoRyZ9vIC/JZtSLWIw==
X-Google-Smtp-Source: AGHT+IFYgHG0dZf5nqkpv4qVu0ChzNBIdAhruIWmcSZxRpa53s1lF8WlI4xTjt862E295HdVdB8Wq01IovaBffAM0m0=
X-Received: by 2002:a0c:8f1a:0:b0:653:589b:ac47 with SMTP id
 z26-20020a0c8f1a000000b00653589bac47mr10654295qvd.18.1695027260535; Mon, 18
 Sep 2023 01:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230915105933.495735-1-matteorizzo@google.com>
 <20230915105933.495735-11-matteorizzo@google.com> <202309151410.E65B8300F@keescook>
 <64e62982-6d0e-f742-be5c-15390d8e7c2b@intel.com>
In-Reply-To: <64e62982-6d0e-f742-be5c-15390d8e7c2b@intel.com>
From:   Matteo Rizzo <matteorizzo@google.com>
Date:   Mon, 18 Sep 2023 10:54:07 +0200
Message-ID: <CAHKB1wJkkkq_yt88_XcrpoM74nhOEBAZuMZLwFkoXoeQQfin9A@mail.gmail.com>
Subject: Re: [RFC PATCH 10/14] x86: Create virtual memory region for SLUB
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Kees Cook <keescook@chromium.org>, cl@linux.com,
        penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com,
        akpm@linux-foundation.org, vbabka@suse.cz,
        roman.gushchin@linux.dev, 42.hyeyoo@gmail.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm@kvack.org, linux-hardening@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        corbet@lwn.net, luto@kernel.org, peterz@infradead.org,
        jannh@google.com, evn@google.com, poprdi@google.com,
        jordyzomer@google.com, ardb@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 15 Sept 2023 at 23:50, Dave Hansen <dave.hansen@intel.com> wrote:
>
> I have the feeling folks just grabbed the first big-ish chunk they saw
> free in the memory map and stole that one.  Not a horrible approach,
> mind you, but I have the feeling it didn't go through the most rigorous
> sizing procedure. :)
>
> My laptop memory is ~6% consumed by slab, 90% of which is reclaimable.
> If a 64TB system had the same ratio, it would bump into this 512GB
> limit.  But it _should_ just reclaim thing earlier rather than falling over.
>
> That said, we still have gobs of actual vmalloc() space.  It's ~30TiB in
> size and I'm not aware of anyone consuming anywhere near that much.  If
> the 512GB fills up somehow, there are other places to steal the space.
>
> One minor concern is that the virtual area is the same size on 4 and
> 5-level paging systems.  It might be a good idea to pick one of the
> holes that actually gets bigger on 5-level systems.

One of the other ideas that we had was to use the KASAN shadow memory instead of
a dedicated area. As far as I know the KASAN region is not used by anything else
when KASAN is disabled, and I don't think it makes sense to have both KASAN and
SLAB_VIRTUAL enabled at the same time (see the patch which introduces the
Kconfig option for why). The KASAN region is 16 TiB on 4-level systems and 8 PiB
on 5-level, in both cases 1/16th the size of the address space.

Could that work?

--
Matteo
