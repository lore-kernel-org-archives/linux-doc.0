Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A8A19E839
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 01:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949114; cv=none; b=grgaxhCcmUiT8nuai7d6Cy+ieEoAy4ziEeAn6ukK243oPrD4p49vITu5ItM2b3d76bQRaIBJndWyCqtkpl87AjNham8MEbm3M3Osv/h409X1l620JE1dqep5UZkpZrv2CMDky/60B5YbEFfzFjgRTsoPeJLeESOVIs30hToqiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949114; c=relaxed/simple;
	bh=1F0+E3zYTyI8ptZzDQigu/lwIlqc4r81mZbSp3NHVzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZIDBXt98Ve1ks03L03wlib4TZOo79BtcWaUWO3+S7nN/ebL+DzBVCZ5/mZDPHUvu+ld2rjGtSN1G55FDsNOinCPSA0wYpbroN73atmJDGcnSNhvnZwoFqWC3JWYTZeCYYQDaJQaltEdtPa3AfDro6+FbdMuTxn5OAZ7ZVPqXj+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci0Vwv1c; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci0Vwv1c"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b9da0ae5763so418637a12.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 17:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763949113; x=1764553913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sU3q2hK0g+DO855f7w9aIzkT4rbLheFA+sEvBqSefbA=;
        b=ci0Vwv1cvhsoTdddy8SNIKa+wPBCSY802fSlE/d4UoU0JXCOaum4STynLENv8Qqf4m
         1YvCUJwOi5xo945YO+tmdWpGg2m/DbDJbWini+yz0G9+9XlZHvDIIVFVFey9wCyqSnaV
         a6Dd2iDw7lbfQpCHPQ+s1e5QncSSxz5cHEiuOgoHEKAlIfsaguF/c6677mExL+Fe8frc
         EmRgbos/TtHpWA69zhZ9A82kT+nw4MEAlywaN2xWE3lDlEI3WD1UDo+Mvm1Oq7a72GXS
         NOFDkfF/xS3i7tti6oxkkWhN/RhwPgFRdhsnXyOEnPypaJwPtIrikrcai9oQqEU7O/9H
         6aWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763949113; x=1764553913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sU3q2hK0g+DO855f7w9aIzkT4rbLheFA+sEvBqSefbA=;
        b=HjL3lTvhZhumlrAzB2AVwybfGuB/9nfGCNbH8i1o8khGSR7Q6fj+VafQm5XwN65Rdb
         ww/NIeZguzvW8XMm8H2DIQOnqoeYYOZznMM/W9AEFFuAq5J8d+afbRqgnzY7/eI9GiaL
         kmlSbmCowyfKooq4zshAasRENXC6iReNQ0T3rFqQ+lPDgJ/lgInzQCgBtcUEwfV3Yh/P
         avrLzKYL/cvu0zwHOC2v42nlIueszvCn3aJZbTZF37YB+3IRqqFTwOnUjj5vsBdQ5cUW
         MUINruY5ueYB1E/yP9wgtgUn6tQTAyE7mV2fV4wtWThuJo/nh+fNAEBKI9IxPkSD0Xzd
         Sk9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJU9KrI1hegt737JRA1tHdkZy2SkHUkGCUzqoOX06V4Rnc35inOJjQiGxXd4I1mh+W6ENt8qT7Wfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXucqCenJlVL2QThtWt0uB/yByPqjrg5YZ8BNDlg4/uPrpbHa
	tNg6qxwlHIwCWLke8Kh2iFFzhG7QY5kgW9vLcXevn/CLCbciLYOlzptcvsw3YS6OQomazR1I1nX
	b0DA51RywTaIVGbWVNpUOb2nq+LXSo6g=
X-Gm-Gg: ASbGncv3bmNnmFm409c0mr7qZsezfLTk8C4SyT2U2pyUfQsMzgKmR9lHLwmIOR6QmA4
	H+5b4vdEZN21+WMfCxLoVwVZ7W3uXuVSUY7sNrDrr690uIAfmELfgJP5yBFIo+wnPvJf/DBqBBb
	rTDkdfovbMRDmzwM/FP17JPIWRhlziUi+1ppT3x1z16PQLC9rDbMacNwB0xVvF2UhrKDFXvG3un
	zcvXz1zhphBLlIXbUAUvpLUS8JvkP7WlPkPbWiktHUy0F4CT1n5I88e5Z6tjhI6DBOtWBoPRUhn
	DbdBAfmc/5FXVoTsfnKpFXe6or3NUL3bLqu7BxymNOkC6IqvTd1OZtf2Bl5iUidjFPFLYAdz7y5
	4rwSfYtaCkqCbNQ==
X-Google-Smtp-Source: AGHT+IExvhm0ye/CgP5U0YMNnhwBib5g4bKZpNNk3Rs6jeN5aktgLZfYM9Ic930Xg53xFD6gWL5ZdghiIJniqy+ocrY=
X-Received: by 2002:a05:7301:1906:b0:2a4:3593:5fc9 with SMTP id
 5a478bee46e88-2a7192a30bfmr5751429eec.3.1763949112678; Sun, 23 Nov 2025
 17:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
 <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
 <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
 <20251117133203.71b97d47@foz.lan> <CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
 <20251121104057.5aecce59@foz.lan>
In-Reply-To: <20251121104057.5aecce59@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:51:40 +0100
X-Gm-Features: AWmQ_bn3alqvdGDl6y_WWYUeptuvgb-0QH46jOX1OBNwxB5dYviIAommqtUmEXY
Message-ID: <CANiq72nhrQsUcxm-1bsBEaGVbRgmAC=mVxrQ+A7TLcVuOer9oQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 10:41=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> I'm not talking about stop using rustdoc. I'm talking about using
> it to output on a format that Sphinx can understand, and let Sphinx
> do the final output, solving cross-references.

By stop using `rustdoc` I meant its "normal" (HTML) output, i.e. the
webpage with all its features and so on.

The JSON support is unstable so far:

    https://github.com/rust-lang/rust/issues/76578

And even then, I imagine it will always still require a kernel config,
so that isn't an advantage either.

Thus trying to mimic what `rustdoc` does is probably going to be a lot
of work to maintain, to likely get a worse result than what `rustdoc`
already does.

Something that would work without a config could be way more
interesting for us to integrate into Sphinx.

Thanks!

Cheers,
Miguel
