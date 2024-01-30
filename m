Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82412BF27
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706635178; cv=none; b=Ev9nKHiaL18FuUwkqOCL8PGOd8nqILTAoxaAU5bRG4f0u46xCND23v4562hX1NkSXpKqp67xE2tTzP9tX9rDAYy7/ZYpUVCaNzXxADyc5t3kZJjprtgday/zZ0fcZbfaRqzdbyDEuZMZx9GWnEZJ6EDg1h2rBxj5Dgbv+sWYoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706635178; c=relaxed/simple;
	bh=MXB8nHIxUOIlWPjJcwClC+cIWIOI5VM1JpyNxg8S8IA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNJgrgeFCmRE5Pf9uHtwgdUi7Bbz1n7uWZIBv6khWTQRk+FrkpTgxG/3lk8XJUmk7+O3Kb1IFhLTljNjPHdbIT0tg5BRBAVqOEGYQkEiwy2dpqrG76Dm8wU+TNMcva8Ufm4hWxnHn0vw9+dpvnAwvZWpXqVkkvmpmfYIaGJ8KyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HpJCI1+l; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HpJCI1+l"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-210c535a19bso2431999fac.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706635175; x=1707239975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kKQLlb0evAqQza2plsrLLpJWDm+L/B1ypMmI8Yp6TYg=;
        b=HpJCI1+l2AgXpEQHmD3aWGFd9t46K1DRrJrZaWIazDu+6HmsZehJAgzTORctmEcZaj
         pH8/LEm+xDL05tqzGPH5lwjNi/RDEVwfXssuzKddGZVfjURCSOZmxawmTtqVlj2Dp6Eo
         kddl62y4soqLUleu2cl4jbzdXkO4EZIIAqefg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706635175; x=1707239975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kKQLlb0evAqQza2plsrLLpJWDm+L/B1ypMmI8Yp6TYg=;
        b=hlV7TxxlHUkPfnNSOnj4FZYcBCTPdRHMoW8fkUvkKk+itrnazAJLk3t0edYQUfEfAB
         EiInDIeobgJXoLb6Yun/bt5NlejCdFk0aFTPo6g9VgyT+4doBvrwy7dHSUD8sVleriin
         5VYSoEI0xP1k+KYxiKsTWelHNPQs6VLL3hy1sKN1nLabi6vOq1EHqBR4uwrSqGqkRw5X
         mVVzMadC8jGsS+CYU1Vr1Qtp+ZuLsltb1J5xHIBzFdNGCo2xu8EMN4vtoRWPESEo2zCv
         8o9LdR5VpE0I5Yj9+WO+95P+vsBk7T4rOfKgfJfFa9k0em0N49j9YrUuqtrxQ7GINtgq
         FutQ==
X-Gm-Message-State: AOJu0YyDsdNsqERhcHjJrBe9+3SgafBWuuMpsgLe4Sa9JECL/sfiZ1rP
	SDBaKzixPnzJyQynvhLtSPIGwtDhoY1M2GZ4rbkxFXv73co0S0T9MIjxZfr3PSfMhTjTtEAOCxW
	G0A==
X-Google-Smtp-Source: AGHT+IGPXw5tl4UiQPY2+tlSCbHqOx+oGsKHpo4zaykdajDk23TvGqCL8XWurqVFZFu5KshiNMZcrA==
X-Received: by 2002:a05:6870:8608:b0:210:d385:e497 with SMTP id h8-20020a056870860800b00210d385e497mr7850674oal.17.1706635175368;
        Tue, 30 Jan 2024 09:19:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVBclXUMzOB3GTmQZ//HzYs3gEvULWEmNzFhz226Dz4UbLno9WRLKdRnVbce7P0NQv0qPHxwc/jX2v7jP9qtVCp1uXmVn3Jgqrg
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com. [209.85.161.44])
        by smtp.gmail.com with ESMTPSA id ba20-20020a056830461400b006e11387b7d3sm1753967otb.37.2024.01.30.09.19.34
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 09:19:35 -0800 (PST)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-595d24ad466so2816280eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 09:19:34 -0800 (PST)
X-Received: by 2002:a05:6214:21a2:b0:68c:4920:4e86 with SMTP id
 t2-20020a05621421a200b0068c49204e86mr5687911qvc.109.1706635153627; Tue, 30
 Jan 2024 09:19:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org> <20240127185311.391940-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20240127185311.391940-1-sakari.ailus@linux.intel.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Jan 2024 18:19:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCu7+ceiuoVZAFTRRptjzmYviuEdHkhcFy=S6ySOuPCvWw@mail.gmail.com>
Message-ID: <CANiDSCu7+ceiuoVZAFTRRptjzmYviuEdHkhcFy=S6ySOuPCvWw@mail.gmail.com>
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Liu <bin.liu@mediatek.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O 'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

Thanks a lot for the patch :)
On Sat, 27 Jan 2024 at 19:53, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> pointer to an array, which is what's usually done.
>
> Add support for such arrays of pointers to kernel-doc.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Hi Ricardo,
>
> I tried to ram it together with processing the rest but it seemed
> to complicate processing the usual fields.
>
>  scripts/kernel-doc | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e8aefd258a29..728b1ffc0478 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1509,6 +1509,15 @@ sub create_parameterlist($$$$) {
>             $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
>             save_struct_actual($param);
>             push_parameter($param, $type, $arg, $file, $declaration_name);
> +       } elsif ($arg =~ m/\(.+\)\s*\[/) {
> +           # array-of-pointers
> +           $arg =~ tr/#/,/;
> +           $arg =~ m/[^\(]+\(\s*\*\s*([\w\[\]\.]*?)\s*(\s*\[\s*[\w]+\s*\]\s*)*\)/;
> +           $param = $1;
> +           $type = $arg;
> +           $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> +           save_struct_actual($param);
> +           push_parameter($param, $type, $arg, $file, $declaration_name);
>         } elsif ($arg) {
>             $arg =~ s/\s*:\s*/:/g;
>             $arg =~ s/\s*\[/\[/g;
> --
> 2.39.2
>


-- 
Ricardo Ribalda
