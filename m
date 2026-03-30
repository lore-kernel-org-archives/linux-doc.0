Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AFF3A1A28
	for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858183; cv=none; b=eeRzhRa6W9aWPYuK/pVDs7smdWynOcCflYBP11TY0hMMhdYVGKXfeE7SFNfD1ciPWNOCcst0EqhatSDrfjNkTKGZ1mlA+5knolwyGJNRyJSWd/AN6bd53d8T9E4YurpHaE+ssSsCh9R153iYYLplxtZbe6bSJ8EkweqgZNo5sF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858183; c=relaxed/simple;
	bh=tW/INbpmXJVg5bz2Qnv9IGM49uAG3MWpQtvcviWEy7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huyIM6H9RR/iDUJ4L1/u2yu63uwrtVG/XowE46Jl4RvJvUY9aqcYdt7WAYw/CvFBwqNMAIPIccP2bUii92p/dnM1TEmwPfEICMI7pWEdMAS8T+7rJo78oWS4/Mb15ahhu393jhOOfJqtMlKUts24MxLX84QfYOrKTUmM735iSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5637886c92aso1975862e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 01:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858181; x=1775462981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIsXweoHuxY7XSIOhAMab+JXNuNNW1YEPO1/VtWzLsQ=;
        b=p0jboFaxcRWNVQLx7B67iev2xmf2qz3lIspiQnFT6jhkPjQJb3+zZKxt1idJaZ3sn6
         5e5aCqFV5SXfUOVUtzSk2x55H2bSRdm6MdVbUIB/49X7qyFJ3X52DeLU265fVr1dLh34
         S1ViWlkMrwey/33uPrGM5LWVA1SM9j+tZ6aTYAiw+rczhsaUddveW9RR9/9y2W7W5ggH
         iU2ImFouSS24GHL5o2A/OnlRa67un3WZiLdsy/5sAhiYTxJ/FuXbGS5lpLxpF/BSpcYz
         F/Jn+srr6hB+xLrM/wf49lqzN0R2Kz5ZVU1orebQ3hNE1YlINYeb0LMvLnCJ1XJORb+8
         QYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQyYh0tIfG5kLaOVliQ+DiubWg6G/Zu/1Vn4/NZdyLfmZWT85/ppNmfke7CETAhTJae+U5814Kq4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkzaTJnpO9JnHM33i5b31a+djflYPnRy1C+V77BS+H7bkkLJ03
	GcEqaESfgGE8nkG3Q0r6dxzYVoedtxsnxs+ULo8CZtRAViWd+N+GT5EYsNUNk/PI
X-Gm-Gg: ATEYQzy5wir3/85X1/qB+KouDKl7Wn3I3oJuk3QGK/YlBjuA6rJqkNLHMASre2ukph/
	90PFT+0NAAmbCax8X1HXizTUuq9dozKolCKX0thPKrcvf+NTTh4SBDxcGeHfHDABiVwq8VbqaBl
	7L9MhJUqVMfcwRudrDEAjVBmNbVHJYQNEOC+kJ1F3VgpiWqqVGqv0crSwkApxPpCohiGuTDsz0m
	YhBwFEPMCNHRZnMj5yp1p8YBYX8noIGzYN8otZq6wslntctR1KX7RUhGsN28ZIaN2V83+sM1dZe
	GxGT+XTUvGQQ4kEfcyXzAB4D/UtlLHYQ0HqDpr2ymNGvGjhnVBn2RSffBLw+eUrBtf1EIVuZ8Rz
	2E46lVIRAP+A5uGFqACgF3aDJyX/COiwa/CSx4UVd9/f0u5ZaUURxE4DEoXwjpbir4Ta9fjpeTD
	F80cm6TfBVJr8gf0JMheDvXaMtASpPRpF2e1E4Uw6DqYNtrmUukDqNymj+hxjk
X-Received: by 2002:a05:6122:311b:b0:56d:3c26:20a8 with SMTP id 71dfb90a1353d-56d4a4d2c9dmr3822319e0c.3.1774858181309;
        Mon, 30 Mar 2026 01:09:41 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58a46f4dsm7733055e0c.15.2026.03.30.01.09.40
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 01:09:40 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so999765241.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Mar 2026 01:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXD4ksorsP7BRy78+OSCPbCreLo2ItpdToCn8UC95D1QnMixeqflLixh4D54JFTuljlZ2RZSayt9AY=@vger.kernel.org
X-Received: by 2002:a05:6102:8028:b0:604:f29d:84b1 with SMTP id
 ada2fe7eead31-604f92960b5mr3654837137.20.1774858180376; Mon, 30 Mar 2026
 01:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aaHrsTS9iG-PEfue@ammar-VM2> <aaLIhgJjrNlp3oTy@ashevche-desk.local>
In-Reply-To: <aaLIhgJjrNlp3oTy@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 10:09:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUcDrDR-1f5eXjdyDR3-HcTFFeGsmYU2whV=fQhzsCNtg@mail.gmail.com>
X-Gm-Features: AQROBzCLuIVPTTxt7k5F4tDK5RHqMB9Fn11dB6AR3oeM1joJzuqZmax22uYJ_WA
Message-ID: <CAMuHMdUcDrDR-1f5eXjdyDR3-HcTFFeGsmYU2whV=fQhzsCNtg@mail.gmail.com>
Subject: Re: [PATCH v2] Docs: iio: ad7191 Correct clock configuration
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Ammar Mustafa <ammarmustafa34@gmail.com>, Alisa-Dariana Roman <alisa.roman@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Feb 2026 at 11:51, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> On Fri, Feb 27, 2026 at 02:08:33PM -0500, Ammar Mustafa wrote:
> > Correct the ad7191 documentation to match the datasheet:
> > - Fix inverted CLKSEL pin logic: device uses external clock when pin is
> >   inactive, and internal CMOS/crystal when high.
>
> high --> active

Thanks for your patch, which is now commit d2a4ec19d2a2e54c ("Docs:
iio: ad7191 Correct clock configuration") in char-misc-next and
iio/togreg.

That commit message still says "inactive" and "high", thus adding to
the confustion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
