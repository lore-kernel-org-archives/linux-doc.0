Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E6676C87
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706650343; cv=none; b=kncxzllP2gdj4JnaW+NndWfgH2KwAkD07BBkHNcNt0/3bR1ZXvrqxkN7lkr164wxX32EekB/s2bagBud6a7i8jWfjv6CWBmjiu8/uBS2jiqVBkNA9Vt/viDaV54PmYBEJubxhVm2EypE0KXn39gDqsBNfdM/0Unz6dudDqe2ut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706650343; c=relaxed/simple;
	bh=pLDJIlivDA76J3u8RPuDVNJfSiQX6K5f8L8wRY6QqGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRzPhziY1B39EU1fe5aUL6OI+Htrh7R/nZ8rmDOxxa/q180PfDrrqR6JelrXb+DVTr6zBBWP7XcOsz23gmWSjaiP8BvWHRvu2i2te1OBDvpNzvKKyZv4NSsuT/vVQiqFkA6J2ys+B8DGS2dzPESgWWyWOICIqUIDnu1Jo6ONEl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k0l/b7kR; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k0l/b7kR"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc6bae46ec2so92342276.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 13:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706650340; x=1707255140; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lGwNtUqO6lN549vUuSahcDGtr44SbkmsEKtb68oJYuY=;
        b=k0l/b7kRCFjnGl7jK1nnd0OGoTO1m69tUoOPKtSET2A5b8UkWXhR0qp5tpgAIcWSHV
         zwGzNkXhqSojbb6bL9sdQoT8OAmHBDRq0+Q/lgnVb/qFXbq8SzBOR/7JpxaIFK+7K4PC
         J71SZXG+vqqLuqFOqXigStMpbfPd2pXVIW34I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706650340; x=1707255140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGwNtUqO6lN549vUuSahcDGtr44SbkmsEKtb68oJYuY=;
        b=i+kmjyTzgf2BG9PVPojPRuhsln2PgiOcjROzHLtWgFfdl4J2jt9V6OMYANiG9n9qaA
         urkR4LsMSUzFof1a0RPgUa8tleefrydM6A5remiMmDu/1BHJLQGFFQ8nK40tJozTRw2t
         LkJ6PIDWDjEl903onr/d7hhnQdIq4nFtG67uwvZ+i7JuzK5dQy0YQaAiVpobeX13zOUO
         Pc277diW9epgd7dd04pFJPjOvW8uS6PRZKLWNQ19pgJr6ApvaqjpDnGfb/wC2opvd994
         gkxaw0vV23aRYmxV8KW3I+ny+Bt5rApxft33MmB+z0xcy1WItUORb0AU8Hn3IcoIzRkR
         Ykzg==
X-Gm-Message-State: AOJu0YyzLA+qbuETydXhmlXo5exfdBAZ6FtPaXwuZZrn45A3NN/CNBXV
	TSIItopSgR2pWw9fPZvZ8h9LLL+7UqeeczZp4QQpklQi61UwoQhPMCQAG0h7OJoKfUUy3kKrxg/
	HYA==
X-Google-Smtp-Source: AGHT+IHpowP5Ur7iZI3A1DrNR1Nu76T3IHPKaI//amMQ4J/+4W59ufg9JjSRs02H8XiyDiK/0ImHtA==
X-Received: by 2002:a25:8804:0:b0:dc2:2f7a:6dfe with SMTP id c4-20020a258804000000b00dc22f7a6dfemr6778522ybl.52.1706650340406;
        Tue, 30 Jan 2024 13:32:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWAxhiQJ+G+n+W1T52bQFruAsmjqTqTqFobaxOLhpy1y3chXUPchVyNKlJtPvp7BfDGS5i1ScItFpoWpDBKZtvvz8EXDthfzpDr
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id n8-20020a259f08000000b00dbdb2966f67sm3128483ybq.24.2024.01.30.13.32.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 13:32:20 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-602c91a76b1so53871637b3.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 13:32:20 -0800 (PST)
X-Received: by 2002:a05:6214:f24:b0:685:9e60:b924 with SMTP id
 iw4-20020a0562140f2400b006859e60b924mr11353729qvb.2.1706650319277; Tue, 30
 Jan 2024 13:31:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126-gix-mtk-warnings-v1-17-eed7865fce18@chromium.org>
 <20240127185311.391940-1-sakari.ailus@linux.intel.com> <87bk92a5of.fsf@meer.lwn.net>
In-Reply-To: <87bk92a5of.fsf@meer.lwn.net>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 30 Jan 2024 22:31:44 +0100
X-Gmail-Original-Message-ID: <CANiDSCuhO+kaHSJgnHMi0VWVyz+ouzONNmeWfWUNj7SDifEPMQ@mail.gmail.com>
Message-ID: <CANiDSCuhO+kaHSJgnHMi0VWVyz+ouzONNmeWfWUNj7SDifEPMQ@mail.gmail.com>
Subject: Re: [RFC 1/1] kernel-doc: Support arrays of pointers struct fields
To: Jonathan Corbet <corbet@lwn.net>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
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

Hi Jon,

On Tue, 30 Jan 2024 at 22:10, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Sakari Ailus <sakari.ailus@linux.intel.com> writes:
>
> > In a rather unusual arrangement in include/media/v4l2-vp9.h struct
> > v4l2_vp9_frame_symbol_counts has fields that are arrays of pointers, not a
> > pointer to an array, which is what's usually done.
> >
> > Add support for such arrays of pointers to kernel-doc.
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> > Hi Ricardo,
> >
> > I tried to ram it together with processing the rest but it seemed
> > to complicate processing the usual fields.
> >
> >  scripts/kernel-doc | 9 +++++++++
> >  1 file changed, 9 insertions(+)
>
> So I went to apply this...but b4 then pulls in a whole series of
> patches, none of which were sent to me.  Since this says "1/1", I was
> not expecting that...  I've unapplied it; can I get something that isn't
> buried in a bunch of other work?
>

b4 shazam -P _ 20240127185311.391940-1-sakari.ailus@linux.intel.com

worked with me, including the trailers... Do you prefer to try that or
to wait for Sakari to resend it?

Regards!

> Thanks,
>
> jon



-- 
Ricardo Ribalda
