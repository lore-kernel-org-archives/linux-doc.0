Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B299C83F01
	for <linux-doc@archiver.kernel.org>; Sat, 26 Aug 2023 07:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbjHZHan (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 26 Aug 2023 03:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjHZHaI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Aug 2023 03:30:08 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989141FD0
        for <linux-doc@vger.kernel.org>; Sat, 26 Aug 2023 00:30:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bdf4752c3cso11609565ad.2
        for <linux-doc@vger.kernel.org>; Sat, 26 Aug 2023 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693035003; x=1693639803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CqFyAMQ/NEx7yEtjnGCEGZfyqhrq/vnvZyQ6gXe7Io=;
        b=ieujeqA9N/TfU/OAbSJE8YfxngCmvXR4gsSqKaOXVJEdmVmSeXON5W24Q7DVuBx7/t
         M6gkn2JpdbdNdtW63mDbCxmoY2ejMaaBiCkT5oKy4K525PguByrlMI/43XmOkJIBLiSq
         LT/R6VaeiTLsXMHo9J9V/mSIWmpivBYzQfbgXPBNY9w2Z6qL/TS4p5sbucKWGkKZIv0n
         S7oCKO3HwmZb0ay3MZWmA3KO9I/75LfHdgMC9XW9WWyjIPmT5n6Kq/naJ4OoaNVXKfzl
         dekyLDaGMQYtI+DTlnGZVC7vcoRoGeUCI/9UcstV0PFwo1WcnP2bo7JEcxoLQrQwToZq
         VGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693035003; x=1693639803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CqFyAMQ/NEx7yEtjnGCEGZfyqhrq/vnvZyQ6gXe7Io=;
        b=ieNDTwO/eTUIcVAwU2rEX6ksNLerjXBFiZ5QRkmu/femZSJbJCclo0lVX4iqK8kyPl
         wQsYRzWgtz+fWjp+oYYLkTQn9aVsuZcBexjnNj4VMlJJVuERk9imejO1x30st+cutXfg
         vSDGMLNRcWliTdNdx9BLfH80PvwgnoKsxMZOyWNCmOugAajgeCzWjjAG0lToy71KU8o6
         lsRFkQMTSpu9vIxsTMdREe7LrVUTgeQrLszAIBuS6ELv66NyL2piw0WeoOTkgd5XoCjl
         +uwzbt9MtaucReNoQ8+phzdMHKdATKfDk/XTjYlL7yqZspAk+v+iXiatq16pDdi1OPcF
         KPGw==
X-Gm-Message-State: AOJu0YyYu8KfflQebDP8CELpzao/7rwVrnMLov9PYgL7N27WbsjBcEIt
        1EaJoS8HIhmX3gC9NbmjsQtUDQ==
X-Google-Smtp-Source: AGHT+IFk37CMOS1xQ4ye3EHiPgykN3Yffd2tVo0Uc5MDoLthwjhO+tm6XDC0HF0yz8mJ50dgm382YA==
X-Received: by 2002:a17:903:25d4:b0:1bb:94ed:20a with SMTP id jc20-20020a17090325d400b001bb94ed020amr16657758plb.24.1693035002767;
        Sat, 26 Aug 2023 00:30:02 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-204.hinet-ip.hinet.net. [211.75.219.204])
        by smtp.gmail.com with ESMTPSA id j10-20020a170902690a00b001b86e17ecacsm2994238plk.131.2023.08.26.00.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 00:30:02 -0700 (PDT)
Date:   Sat, 26 Aug 2023 15:29:57 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Namhyung Kim <namhyung@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Thomas Richter <tmricht@linux.ibm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Jiri Olsa <jolsa@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: userspace-api: Document perf ring
 buffer mechanism
Message-ID: <20230826072957.GA75980@leoy-huanghe.lan>
References: <20230819093340.265817-1-leo.yan@linaro.org>
 <CAM9d7cj=ichFk4bVQSbyptqy9wo8GFm1Z1Q7QzfhMFLjewNF-Q@mail.gmail.com>
 <20230823023838.GF57731@leoy-huanghe.lan>
 <CAM9d7cgaMyH=vSjVEOBjLzBWbZOricm6aHcP9hfLsTJ_gUEh3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9d7cgaMyH=vSjVEOBjLzBWbZOricm6aHcP9hfLsTJ_gUEh3g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Namhyung,

On Tue, Aug 22, 2023 at 09:26:05PM -0700, Namhyung Kim wrote:

[...]

> > > > +Why ring buffers are mapped with above two different modes?  Here the
> > > > +write direction matters.  The forward writing starts to save data from
> > > > +the beginning of the ring buffer and wrap around when overflow, which is
> > > > +used with the read-write mode in the normal ring buffer.  When the
> > > > +consumer doesn't keep up with the producer, it would lose some data, the
> > > > +kernel keeps how many records it lost and generates the
> > > > +``PERF_RECORD_LOST`` records in the next time when it finds a space in the
> > > > +ring buffer.
> > >
> > > Thanks for the update.  It's unclear to me if all 4 combination of
> > > (rw, ro) x (fwd, bwd) are possible (yes!).  The rw mode and back-
> > > ward is also possible but just not used for perf tool.
> >
> > I can add a matrix for the combinations:
> >
> >   The combination is supported in perf tool:
> >
> >   ---+------------+-----------
> >      |  Forward   | Backward
> >   ---+------------+-----------
> >   rw |  Yes       |   No
> >   ---+------------+-----------
> >   ro |  X         |   Yes
> >   ---+------------+-----------
> >
> >   Yes: is supported
> >   No: is not supported
> >   X: is not feasible
> 
> I think they are all supported.  You can use rw mode with backward
> direction but it's just not intuitive.  Also ro mode with forward direction
> is working but there's a chance to miss the start position of the
> previous event.

I am a bit confused for the all four modes are supported.

From the code [1], we can see there have only two combinations:

- overwrite + read-only mode (PROT_READ);
- no-overwrite + read-write mode (PROT_READ | PROT_WRITE);

And I think perf tool must use the backward writing for "overwrite",
and use the forward writing for "non-overwrite" mode.  I think the
code [2] can help us to conclude this.

In the end, the perf tool doesn't support the combinations:

- overwrite + read-write mode
- no-overwrite + read-only mode

I have sent a v6 patch, please let me know if you have any concerns or
if I misunderstand anything.  Thanks!

Leo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/evlist.c#n474
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/mmap.c#n141
