Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF92949F4
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023814; cv=none; b=FU3/gckDgc5ARtIk/NNS2+C7tc72CqU6mvdwMhoEQQitqy0Sf8ltra82MEfJf3qdJTT5G0YurGJ9+ORZEGk4UFEckC8ascFRIv7qXzvRA1xfkq87ATzSm6kJWydL++YWQ7bZ4AMjEcYEZv5G08lcGTiftYlhVyBu6oNGsZEXeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023814; c=relaxed/simple;
	bh=UU1RX1eq4TtMyJ2pnNDAtBTGry3M60mWbysvaPNt8HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxQKxtMy6RR8r4ar2ggK7CtGibsb7UI+JkJ8NJRZiCE8zwQtr59CFBsmv1D8lbRkuTbf+03GT29n91EUORBqpXBtO+uAZxM5Yk5WffGCPjmb0mmLCzZpVUpsTEVxRkyXPXKtElDVsnxmySb+YRbfVeL4/uRjL2mYA2MCxfTzz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=vhTiVtnT; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="vhTiVtnT"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4767e969b94so1554771cf.2
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1748023812; x=1748628612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si3A8XaUwff9ewfSpNvPOminfhYVFidrmtQfQaknH9s=;
        b=vhTiVtnTz4LOjwyzTdabaDahbKkVHP6urUwaCxgIh6syZFInBoixGfTVXPrxTQMCv9
         Isg1maXlzIOZXap/wLfvoDQ32bF7VBPxw1Yl6W79KTL48bwJODecy22ftdiMmPz1XOnZ
         xaK7iIEhMFGSwpR9LtXvEZNexN50SvecTqUaKCA5MEaf3fzqKQ/QNw+z2IGCjOMiHnlo
         JSyHbXi+vvVi4ILn9ytq2WksmTPDKEifR0StZ5tzKu/AJh5PXv/7wFbFCBlDI9zSRyvY
         onRnBdqXuz57SJO7zXbRpwnoODoXHqNdb7/4p+2a7wJ6KscN6Pswa8MNVWDmibJDBlGU
         gWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023812; x=1748628612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=si3A8XaUwff9ewfSpNvPOminfhYVFidrmtQfQaknH9s=;
        b=sRQ8Crvyru1rRKzX4hOEqddyOPm1Hoa24l+KsaDq+mYY7W4123gjVyVbhvitHzXLsX
         icfwElQpnt9gM8syX1n4RWvNIB5ZTtnuMPok4RNOq1wHIaTmix3M78EUaVTJE43AObFJ
         d3CO11uZDwFAS01cE/vJ4ZRcje2rdE8N01hMW662O4KfsWKrSxhMPiqV5yyAPrZi/d95
         fuczFOICyRZ4fqvTWkBAaFr+igFTpelX1U+9xJAKsYQTIUJaSSnWBX8HCHQ8B3/I2eS7
         eescwVa2s4h7UmYRJQSArKwwklK1WhLxzmiCIEjGRAcfgGVtdifloHUwRBFAr3Wbzjtb
         KAog==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6wRNfF/JJgAKsNZpUK54O0N+akGce6C0qCWPz9scEEWVh1OfznOKy6o2A8+hxbZBWLIOLIeAsf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKkG2t0VoaWMlWLE4fHPkV2dRClBTOkzLCpyemNvqZ6kLrf95
	pIkTSTl59WjokggkPLs4CbCzsYyjN0oAexvIx7di4TmVPoGPrCC0gSljJFkKEHAC0g+BlOlSLMV
	wC6W4XSYdrIa7DlvfVs6XhTLe4xOY1s9GFh3UbOE+sA==
X-Gm-Gg: ASbGncuXogr7VMWqiU0dimwbMxFSDl7KHlU+dKleDKcXo1eCR9ZsXjHjTXFdFb/u6MJ
	tMw8uyLe36Gvcmc8za7BE3XV86e5sRA2vghfrKF/bHl36K0owhAIk+FZshF5jK/o5zL3saaB2J7
	5MJCNDzhtSux2pqn5wcVNlTnfUx1bZVA==
X-Google-Smtp-Source: AGHT+IHrhwlhpbZgGn/INwXn8JABUEPnTpSZnLrw9spErvT2Y1rpItsFgRTQatYYH58STp3erxQD5FNgCdtGvUD856o=
X-Received: by 2002:a05:622a:4ccf:b0:48a:2a08:cbef with SMTP id
 d75a77b69052e-49f4624f333mr3037761cf.5.1748023812162; Fri, 23 May 2025
 11:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-9-pasha.tatashin@soleen.com> <CADrL8HWdAzQRVhLh2Pq1GV2fy6tus66Eo37PvG9A98kUJTihsg@mail.gmail.com>
In-Reply-To: <CADrL8HWdAzQRVhLh2Pq1GV2fy6tus66Eo37PvG9A98kUJTihsg@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 23 May 2025 14:09:34 -0400
X-Gm-Features: AX0GCFsjdnMDiIp0JeLxLW-c2VjwkiovzqMTPqtMLc5iAfcnOak-tebCgQ6toto
Message-ID: <CA+CK2bB5K5zUg+-PZ2xs+iRhQskGzNgt8+ELN501ni9SM98srQ@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: James Houghton <jthoughton@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 7:16=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> On Thu, May 15, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> > +/**
> > + * luo_retrieve_file - Find a registered file instance by its token.
> > + * @token: The unique token of the file instance to retrieve.
> > + * @file: Output parameter. On success (return value 0), this will poi=
nt
> > + * to the retrieved "struct file".
> > + *
> > + * Searches the global list for a &struct luo_file matching the @token=
. Uses a
> > + * read lock, allowing concurrent retrievals.
> > + *
> > + * Return: 0 on success. Negative errno on failure.
> > + */
> > +int luo_retrieve_file(u64 token, struct file **file)
> > +{
> > +       struct luo_file *luo_file;
> > +       int ret =3D 0;
> > +
> > +       luo_files_recreate_luo_files_xa_in();
> > +       luo_state_read_enter();
> > +       if (!liveupdate_state_updated()) {
> > +               pr_warn("File can be retrieved only in updated state\n"=
);
> > +               luo_state_read_exit();
> > +               return -EBUSY;
> > +       }
> > +
> > +       luo_file =3D xa_load(&luo_files_xa_in, token);
> > +       if (luo_file && !luo_file->reclaimed) {
> > +               luo_file->reclaimed =3D true;
>
> I haven't been able to pay too much attention to the series yet, and I
> know this was posted as an RFC, so pardon my nit-picking.
>
> I think you need to have xchg here for this not to be racy, so something =
like:
>
> `if (luo_file && !xchg(&luo_file->reclaimed, true))`
>
> Or maybe you meant to avoid this race some other way; IIUC,
> luo_state_read_enter() is not sufficient.

Thank you for catching this. This is a bug, I actually added a per fd
mutex lock to struct luo_file that is supposed to be used here. I am
going to address this in the next version.

Thanks,
Pasha

>
> Thanks!
>
> > +               ret =3D luo_file->fs->retrieve(luo_file->fs->arg,
> > +                                            luo_file->private_data,
> > +                                            file);
> > +               if (!ret)
> > +                       luo_file->file =3D *file;
> > +       } else if (luo_file && luo_file->reclaimed) {
> > +               pr_err("The file descriptor for token %lld has already =
been retrieved\n",
> > +                      token);
> > +               ret =3D -EINVAL;
> > +       } else {
> > +               ret =3D -ENOENT;
> > +       }
> > +
> > +       luo_state_read_exit();
> > +
> > +       return ret;
> > +}
