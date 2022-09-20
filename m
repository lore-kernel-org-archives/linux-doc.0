Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4369EC54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 18:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiITSMb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 14:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiITSM3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 14:12:29 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B5BE0DF
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 11:12:28 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id q21so5037802edc.9
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=UxJ8rW//GvFRzYiqb7FcOc8c4uS74wXg/hmPFHHyeA0=;
        b=YBLruLr5DBNAIlTAxtA3I1Zr5N+6+7ZpxNpjzAFJ4O+39pTvESNS4BZszLmARDv7a5
         yBVGN7GOBBJFowcCyD7FrfIhACWI8EiIQppJMJaZa8wTm+2kZ5jmVsdG6MH3/4c54TWr
         m7zeVAb/yWZMXPuWx03G5DAxMX2EYgjcoyCDTukhy0Qa5kwqgDL6Bs1EsxL8KwaVfp5E
         s0FnaGMDutVEoerMWhaleTosA9v+M8nKr8gzfaK3VKPvPDZgI8xbWfUuYaxuPjcxQK1x
         VD7DmpnW8dcB6cNTAaWvxZZ9t++KhlI8j4gK2jLPxkacqRGupsysmRuI2ou4nZX/u/DX
         +3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=UxJ8rW//GvFRzYiqb7FcOc8c4uS74wXg/hmPFHHyeA0=;
        b=7w5yva3vaSHyuJTi7K1ri5GfQE48Dqlp3Vy8StRk7jdEmkK45URyII/08XEgE+y3Um
         hpGd3Oxj6azALQEb8C7rupoDirUh5STDDP14JmxhkdCKu7dBsBUR5uRyo3Ucr/A4+giD
         qfNCqVqSTyk1aEpe5WEXtfl0HSMGXsWNE+6QzUUn77CqwlCL24kR9/3ojtDzAX/c/V+9
         FXqUfV+TTjUIbmAI9M2uNrmsHinrvyDZamCDK2MPiBMQANDfhlrTfLZTPc8mFjqDSwup
         LXdRy62Mq+hxnijsFOD3txdbbB8uA6h7xQseAFDie/cJ8xUjkAop3CfzametY77k3lFN
         9kgQ==
X-Gm-Message-State: ACrzQf0EgXpZJT5OqC24iqY0SOrxZ+dN+6F9eNWoBarFnCIzY0SoKOoV
        vDSPRj1EAx4r5HnNsGXm81cij1+QfOwHzqXvCl/ZBA==
X-Google-Smtp-Source: AMsMyM7PMxdTFGqqTHkNV2MZvsSy/zTh84aME965vBYd0cNVakCzxExWkU8Vx5Y8SwaT9xnkrtg0AOKAgquknl6Z1K8=
X-Received: by 2002:aa7:d3d3:0:b0:44e:baab:54d9 with SMTP id
 o19-20020aa7d3d3000000b0044ebaab54d9mr20817547edr.43.1663697546757; Tue, 20
 Sep 2022 11:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com> <20220912132322.7c486c40c6acf8eec0785c87@linux-foundation.org>
In-Reply-To: <20220912132322.7c486c40c6acf8eec0785c87@linux-foundation.org>
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
Date:   Tue, 20 Sep 2022 14:11:50 -0400
Message-ID: <CA+CK2bDkvgifEXh9voz5oYog-rDNm2GnqTZL=-5HndOFF2CJqg@mail.gmail.com>
Subject: Re: [PATCH 0/3] page table check default to warn instead of panic
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-mm <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 12, 2022 at 4:23 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Sun, 11 Sep 2022 09:59:20 +0000 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
>
> > From: Pasha Tatashin <tatashin@google.com>
> >
> > Page table check when detects errors panics the kernel. Let instead,
> > print a warning, and panic only when specifically requested via kernel
> > parameter:
> >
> >       page_table_check=panic
> >
> > The discussion about using panic vs. warn is here:
> > https://lore.kernel.org/linux-mm/20220902232732.12358-1-rick.p.edgecombe@intel.com
>
> The changelog doesn't actually describe the reason for making this
> change.  Somebody obviously wants pagetable check errors to no longer
> panic the kernel, but why??  (The same can be said of the [2/3]
> changelog).

This came from the discussion listed above. There seems to be a
consensus that we should reduce the number of BUG_ON() in the kernel,
and replace them with WARN_ON_ONCE() when possible to recover. In the
case of page_table_check we can recover, but for some it may be unsafe
because of security implications. Therefore, I would like to keep  an
option of being able to panic only because of page table check errors,
but not keeping it enabled by default.

I will add more info to the commit message.

>
> Also, should we be changing the default?  People who like the panic
> will get a big surprise when they find out that they should have added
> a kernel parameter to get the old behaviour back.  It would be less
> disruptive to default to panic unless page_table_check=warn was added.

I was thinking about this as well. I decided to change the default:
the old users will still get a warning, but going forward we will be
inline with the rest of the kernel: warn on by default, and optionally
panic.

>
> If there's a solid reason for changing the default, it should be
> changelogged.  And if that reason is generally agreed to, perhaps the
> kernel should print a warning at boot if neither page_table_check=panic
> nor page_table_check=warn were provided.  To tell people that the
> default has been changed.

I am not sure that is needed, and when do we remove that extra boot
message? This is a relatively new feature, and existing users would
still get an ugly warning about incorrect page table mappings.

Thank you,
Pasha

>
>
