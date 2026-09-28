Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1344833A9F8
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597760; cv=none; b=Be3q+o8jtG1C3plzaB0xWBD/N8jVM+jfOqevgHereVOIyUwNZDj5UYR6PI71pCMERsN/PdlucPxEiDMhR1WZ2TQrOuta572wqh84s+yoWkFUc2KNy4c6d3sC4N/09bmcOtDZ+wN8Ok2mkCb3jR5nUKaFx0nxvSxKMFF4NM7Dbi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597760; c=relaxed/simple;
	bh=ymWANid+W9QAIfsP2B7dxOZPLHb025E1MmiiKZKG/Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TRV09944Iudc+dU+eS19LZl3JIfa5/fzj/lIRahs2I7qqzPm8Ldx//fn/Lnc4BuWzOM9tqK1ziWYqyHwAM1eh1lu4jyP548hX/e7b4l/NHcWYSqOWKc9TTDSIs6HVoF3HFTKZkbcYlLMU/tvqVkE1/X9qsu0/M+/SSFvnaYOkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cda0838062so1376502e0c.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:15:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790597758; x=1791202558;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQP52bKkr7Y/wzuKqDsjuqgLw7VrjDizWZT0Wc7gkw4=;
        b=dS1hEHNOd2uyRnAeboXOzXgylUr70AV8X8T3XtTIkJnW1dD6e/i84jKTnivLF4Zn/v
         +RW6DfU2GFoNVFGhVB1WeMTbltzBddvJSjVA+H9CHcg2OY0p7y5x0AnylasXg0X6NNE2
         Ru9djvDBYhU0n1ffSvvIxcy+tWC29wI49J480ABAu9ZDi/wb2gruv0+6dppx/oEcTaXH
         iVWgNzMx2EAfUimpYFpvTMoM2jdGpCu1LSWDye44/Utl8W9v3iLcw0/ps+55Y6FOVjd3
         qnSzoTTeN1GMWJiMZWOpIhZirudPfAn6/QHofFbPgBK0DBpRsoL8brCm4QZHIooFbJEL
         uAjw==
X-Forwarded-Encrypted: i=1; AKwUvBzlUgYrOyBmj0q3fvOyfEryD6oHgsNTg3Yu0TZemSr94T1GEaXPQOW0abF6HK+qpocuHkDjFNu86n8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlDCtC15KyueE0DrWmZJjieV5TPPqP9UYPHXRJRCKyVEf7BBj1
	JPyue2/pSvM0oFSKGRHPZXrfNOcMKlayPFXBfnbOCd007DWAI4YojM21cMLNUecq
X-Gm-Gg: AYBFou1Jf8AJZBuGWaHXzp/X3RjkzAa40IJpi7D1tvPhCEcoVik7+Wo2NOGUU7PJF1T
	wfk6UptiPefjZ1J7M15YqqtKkixyQ8vA/cQxnT7lHMKVzgN7G+YrnkSgoowzCrTPXleXoxk/Ix5
	z8gYsiWj1F06qOhkrweJiryertt4RJAMmiymgnJFVIcbDZmYfx7G4nexhYs/KMPlm/Xp8dv/gL1
	zoWmKRWt9+rwDASg3+AvwcPL3mWPuIXYfO0PGMREB+BALxZK9LbX2jiy9eqyW9yNDov18bhC5xv
	B73VucZDnTvpLMpNumtcHzwe3wI6ssPf4PHDZeyksv80BOTFhrlSXJO9I1BKQ+vRMFjQMEJsN7t
	LMVH6xn78pbNxhMMOM8S1YLkRuL69D92ZILwPs+rpK24/gqCvy2GxYzb+cJwwj8NS2GU2SbP+Jf
	x1+q69QuJxX/AgAUorX8Fi3FMoo26bqJdwkODgKHRtlE3jX59Fj+f0PugV/36hPoJku7SKicItS
	H6+8kuV9LX+zvQNrUq80XdychDyIFObbTGx0iIRisJNmSA7
X-Received: by 2002:a05:6122:1d41:b0:5c9:c60e:3a3c with SMTP id 71dfb90a1353d-5cb0bd5fa20mr5972312e0c.20.1790597757885;
        Mon, 28 Sep 2026 05:15:57 -0700 (PDT)
Received: from mail-ua2-f42.google.com (mail-ua2-f42.google.com. [74.125.226.234])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde577632bsm9400085e0c.8.2026.09.28.05.15.55
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:15:56 -0700 (PDT)
Received: by mail-ua2-f42.google.com with SMTP id a1e0cc1a2514c-986dfb672d8so1311160241.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 05:15:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxYlU3XAOTEmy4BearHmHyKIEs88DwUmGTI+p5PMqPGcSQAWDicpWXO7Eh6RYBAU/H0t1FaUnN5qI=@vger.kernel.org
X-Received: by 2002:a05:6102:6883:b0:7a7:19aa:8a83 with SMTP id
 ada2fe7eead31-7af1ecf279bmr5070898137.30.1790597755270; Mon, 28 Sep 2026
 05:15:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927205501.672807-1-visitorckw@gmail.com>
In-Reply-To: <20260927205501.672807-1-visitorckw@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 14:15:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
X-Gm-Features: AclHuK85gzWq5IklKOwAQu80W0kMa7pFyTsMwsvdeVooaKjfbbGjxmEBQYgiP_k
Message-ID: <CAMuHMdVcpHrxg_Kb1vpguSYbRg4CU4DxNuPAv3UqHNHZTNk33A@mail.gmail.com>
Subject: Re: [PATCH v6] m68k, bpf: Add initial BPF JIT compiler support
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, ast@kernel.org, 
	daniel@iogearbox.net, eddyz87@gmail.com, memxor@gmail.com, andrii@kernel.org, 
	gerg@linux-m68k.org, rdunlap@infradead.org, martin.lau@linux.dev, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, marscheng@google.com, 
	eleanor15x@gmail.com, Daniel Palmer <daniel@thingy.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Kuwan-Wei,

On Sun, 27 Sept 2026 at 22:55, Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
> Add a BPF JIT compiler for the m68k architecture.
>
> The JIT generates m68k machine code targeting m68020+ processors and
> coldfire parts with an mmu (ISA_B/ISA_C). It excludes plain 68000/68010
> and non-mmu coldfire processors, as it relies on 32-bit branch
> displacements (b<cc>.l) to handle large bpf programs.
>
> Tested with the test_bpf.ko:
> test_bpf: Summary: 1061 PASSED, 0 FAILED, [1049/1049 JIT'ed]
> test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 JIT'ed]
>
> Tested-by: Daniel Palmer <daniel@thingy.jp>
> Co-developed-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> Changes in v6:
> - Fix kconfig sort order for HAVE_EBPF_JIT.
> - Update eBPF-JIT/arch-support.txt

Thanks for the update!

Are any of the issues raised by the bpf-ci bot valid?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
