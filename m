Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC1368D52
	for <linux-doc@vger.kernel.org>; Sat,  1 Aug 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785610941; cv=pass; b=iodnwORaS6JFcMsV1gkNpjIhgYCZD1xAKej4wps7v8bQgRzpN/2t4XE5sYNpl+EBBQc/XR1p7DwLKx5PG7kY5rvvRDhUcfffdGI6aG77k6gUyM3Qg2EoLUuNogI5bN3JpLNlv7n2zmHL7ab16iO8JG8i4wrEd6mrvk1u+IQs4mQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785610941; c=relaxed/simple;
	bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPwAg5UBaRDDpYf+INHRuSnlG/bLIs+DuT1KSUuj65cb7xdkw4XKaWnqEECndXnmbam3oIOME7zYJvA8dto5x9S66LCzd+HjPyP7ALjh2KcGQe4YW4aC+0zhBbgxxvQ/MuyLOoPsLNvcxLTBm4EchH+hrPtAXgTXVESvmWPm5jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdUXF+3y; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdUXF+3y"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a0c8283146so591730a12.0
        for <linux-doc@vger.kernel.org>; Sat, 01 Aug 2026 12:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785610938; cv=none;
        d=google.com; s=arc-20260327;
        b=msPnxyomx8c5tsHVeYK1hjOPz4bbuo0OIXly2Ert9P+fgx08RI0thopRmCG8+TpVrI
         e1n/1tmQNsPaH6Znkt59CZu9YB7+lMcJ21tRbvpMsEBMIDcf+k4jm0ys8Ms6TIToqT+w
         fMN6Kz+Kvp+PWt4q6zhHDJdjNTKRGtYSMrhQUy3Wlg2VTVOU14Zu7bHzRRyIUI90H9nY
         f8XwjVkIC6A9x56I2XTFFbRfkqtjW+ybuLKAVwfe5yvK/3d+61FiUyHpGhbRsBUF3BrR
         m1qKtoU4vIWBIhiCjf0E9v/mydAhYXLPoCnWTnobpyaI9LaAcj5I34UM0A9a4SydFJ0+
         0lPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        fh=NovtfI7KKCZB28XT9lusvh4cs6vN0/x/QA3AVDRl9zo=;
        b=dk6eRw6s4UYOAwYIEfUuDuMLW60KtHN2uM5hMSgmIc+G7sULaRU3WSF55E732vDnnh
         PMFRoybOqIiz5H/gMt0Toe1j4/g6ffB7JMg2gXBzalqeKE5tSWIZQEVwkSPKLrDhnJXY
         rWA6iEh7v47G5/Lcv/6SDGPDhrR/TyBZ08hLyW/+lPpBkoadDk7677bjgYtrhXEZFGOV
         VY4Ib8LIRIU8aVRadEKllHLYcdwJnS8MRJlbXku45i6e7HS9giL5uo6uTi6XbkVNW3+u
         Y7lc60eyVx5d7ggb+nobyTzQq2AjAPTJBaPHci06QjWigWBKMW5qAh16KvHAa2yob/EE
         Nx2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785610938; x=1786215738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        b=KdUXF+3ykfIPwHSaJSeFEHofwhjSnI1tczDKFGkXUMnlNyR3F923FZqksKe39mHwW7
         dCFQwl+6lag2J8mXhqPdjSvJyOfv+oEGR1XZmRmdc/n+8d1Q4YUoJr2cQE8ttNrKZZtq
         q9RKXQGOJ9/j92E1PEnI+5lk20BK153agHD8gQsHInkqmhfCSGUddeIGwN1cziXS1f7t
         85D9Av9CzZ8sRacrA5DqqekOWA/HgBAaE6v7NVE1oM7qHZM6vcKSxa1M+a3CgrGhz9qE
         dXI0Fa+oxV2basBHwq944W/k3QT59qjYK6I8reBNZ2kIQ34OFLV7U2v2qBMOj0//Nh2K
         7YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785610938; x=1786215738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nivli2INTpQAZY/8TzmpQ6V0d9mAXZr2We8tZu0CLGU=;
        b=mKVCUC3exj3CRgRAH9nLpsRlCtFQEO9EWoh1AbfKLj8Mc5cQ/bbAMsIUPifAAeO0GA
         0LkpfFPLHQ23gm/ak3vLzMPOV8tZzY124yiWRrESoNTeOvUk+2Y8+ujBlelxk4o/zVGv
         q/HfTkqgKfWND93/CZ+UjUTFWodCeYGC/ZizWnelN0zRM//OO+H4iZEwx9epoin5YXko
         5uAaVIVfQkaqm5nw+96uixsoYy5lTo0C8JFz/jfJWpX+swI4hkd3IJGNZd/lnzJlnFAf
         Z3aWUMVjXSP5mmmRuppXrSvdRHizRW/STCgkKseDbcEW34/o3S8wLr8VLYBaijvwofvs
         a1IQ==
X-Forwarded-Encrypted: i=1; AHgh+RqciiVK2uwyZRgcVhGepqMIOKb4X/biDoxverNv3QcZDGMExjEK8VXx/XxED/Zh5EKYJ2tdqKV7/oQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo3XotSaDTA10uAcqfy4/7JvJ+7iHd8lEyzA2Qw8UnOMKCg0zU
	NU84lJYIHZA4noeWZNAKeKBng/yQfbKGbAvHEzMcu477/dLLGFiz3yFz8DzrouGDQy4s7y85Laz
	YKQrkkmxXnUdHli8bhrBo6ebhbIGVFVg=
X-Gm-Gg: AR+sD12mzqC1/3sJiOY/mpTEUHeLlU+83+9pCRCMqksdMJhU+Zuhc2+xpAFtwTuxfbS
	wdzNYEKnHhe+hcBgToMqqgLCToUED8HKEbNbXepjJkK1TTSfx0IjfgmPwB+6CoasdZzF6359BPY
	EYpPr451B6YXl/LbMm49+HH9yVU7Po4W5dtP6YQ6cVzQDi60hMSenpyqNCHP8/1P++RmARWThbk
	DSmLm2xeSjXpkMURlytBo7pp04WXnp17ub58McQwiracCkH/UK9P0b2og2YcGrHod2dElZ61Tui
	KtqhgcO7LMZ+ysPde88b7I133UzuBWPc0jqMp1vhlndtDpA=
X-Received: by 2002:a05:6402:449a:b0:697:de29:c802 with SMTP id
 4fb4d7f45d1cf-6a0a7ccb364mr2898579a12.18.1785610937994; Sat, 01 Aug 2026
 12:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720034358.68714-1-john@jagalactic.com> <0100019f7d9fbe81-6cb16662-2522-47ea-a152-fab0ee3d9b35-000000@email.amazonses.com>
 <CAOQ4uxiEzP2e=cRw-AiGxtSv6WMSA5yR3cmgrF97s7ggU6wzqg@mail.gmail.com>
 <CAJfpegt9PwHksYhsQZeCsW0eooXVVihyieTpeHMmC-+Pq8BWaw@mail.gmail.com>
 <CAOQ4uxhuivjMMt_Dm3VwKmOhHg7ZHdAww6j6jp+RMjPoRde+bA@mail.gmail.com>
 <CAJnrk1Yat+SEr=SmZXwUt9y2WcC0VEC4KUpPrkrRSjMEmx42WQ@mail.gmail.com>
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com>
 <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com> <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
In-Reply-To: <CAJnrk1aj4B-T14SMTZhst2XsjOkKWStUj_0cjwHswgYWWuaB4w@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 1 Aug 2026 21:02:06 +0200
X-Gm-Features: AUfX_mx0nmQgWA50AjJPZwCEcEACcDvMhxSi5YeCpVu2bWW7aLZWp00XQH36_Y0
Message-ID: <CAOQ4uxhop5bzpDxiqSdfHS8JyUASfAmpsmuhrpq7Ey28jATVsw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, John Groves <john@jagalactic.com>, 
	John Groves <John@groves.net>, Dan Williams <djbw@kernel.org>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, James Morse <james.morse@arm.com>, 
	Fuad Tabba <tabba@google.com>, Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Namjae Jeon <linkinjeon@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, 
	"fuse-devel@lists.linux.dev" <fuse-devel@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 10:59=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Fri, Jul 24, 2026 at 1:23=E2=80=AFPM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > As I understand it, the merge window for 7.3 closes at the end of
> > August. Just to summarize, the only things needed to get this into 7.3
> > (besides addressing the Sashiko comments) are:
> > a) replace FUSE_GET_FMAP with FUSE_NOTIFY_EXTENT_MAP (will also be
> > good for famfs in general, saves an extra context switch)
> > b) remove FUSE_DEV_IOC_DAXDEV_OPEN and reuse existing
> > FUSE_DEV_IOC_BACKING_OPEN (logic for this already supplied in Miklos's
> > patch in [1])
> > c) remove "config FUSE_FAMFS_DAX"
> > d) remove FUSE_DAX_FMAP capability (not 100% sure about this, but
> > since the only thing added to the uapi is a new notif type, seems fine
> > to exclude this cap flag)
> >

FWIW I'd rather keep the explicit negotiation flag and make it mutually
exclusive with FUSE_PASSTHROUGH (anything else)?

This will allow us reuse of fuse_passthrough infrastructure with less
concern about mixing the two use cases, which at this point seem
like two different use cases.

Thanks,
Amir.
