Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5DC8FE
	for <linux-doc@vger.kernel.org>; Thu,  4 Jul 2024 02:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720059019; cv=none; b=dlGrKbqlwmRL2PBUIz8SNFOD8S10YOYTXDkBrJ8nLFfdYKbQ/LtGf9iaj6Q+XrGEmmPwyf01Scb3AWOMvqfYE2uocCFxiaOGTP7oTkc95bOkzMmYgILn0Qlw/QbT+42Sr97bIyrh618rb9TCwHlR1bV8etyxaqqwxa5dn52dIM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720059019; c=relaxed/simple;
	bh=MYlST24mpbKtsBJ3BHNLxh/JxdUuw6JyaMptEXNRlNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h39nJEftf6uiW1Rf3dAc+UIKp4IlHYt+lsvqm4dAOlMVpruHc7DAz97PDrYbx7X8Db3iRJBJKpLjJf62VgTPtSm1ruS8UQ+TfHiCBHovXyuFd9mn/UwrNyV9OlYcP050WWqyvVq/2DsIbBP7Dczkqxn5rPF1mwJD7NiNzwXP3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IiyF8A3W; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IiyF8A3W"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-65240d22f7cso1378637b3.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jul 2024 19:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720059017; x=1720663817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=br31YA9mgSBq0jqvDk14OoaVm7UCGKco7eR/J7QaPpM=;
        b=IiyF8A3WmWS3Es3qsImH94MHS6nku06044H9W7JaWdjuI/GkkAhnF6jyTG8DhgfQRm
         Q4/Dl5SZnkhpe6E41n38WVwn3gYxY7IC+QG3kk7w3MIx2dAyBcPsN8AYPmlgzBg3Sf9b
         8mDI2nVRvwtazUqhygbyQWZzQ7i501X8+5fj1D3quosWCcMI3RtxR0e5vqpBNsfOIVS7
         fo1R2xDSIJEq95MYkMrdGx3rWC6JSSAidmHQaS4HTDQrRxrk4i9+rdIh1zbhYIq5ZKxp
         HkhL2smAQt4N/5EPbcBhq+1IxAFH3EC1/kAjMBXlGNiIZy2clHzE3ntIoFM0Rf1klMvJ
         4FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720059017; x=1720663817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=br31YA9mgSBq0jqvDk14OoaVm7UCGKco7eR/J7QaPpM=;
        b=A0wzi/Wxxq7DM8Kn7rxpi+1H0XTLEL7uH8g0JPJ6akQiOwosCb6cR95lnGprcgK6AN
         rs/AdJnnawJgyCoe6If/UHKcGz6GaZHFK3yR8zJrnsKaMvZl95iguWJiw3jOmxwz2RqD
         ryUIZj/0lfVQh2PpwV98t5NWUNe8aw/ieyZXOeL9+vb6B2b0oaMWFPuh10mb+vg0CPeG
         z1vWZGei2b6qk5rzK8KP1qVDIPHAqzy1cKkQYDkQN0Nd+hyjNVgF4PrKbZjJ21r/kH4L
         8Z5ozhaJ7/NCKbHWGYreApri87vQD6vaERIedxaE29ELWi8v72kwEjL4r0I5Sgp+Av7Q
         v9vw==
X-Forwarded-Encrypted: i=1; AJvYcCW7CohaSbew6xhwWD7QhW4GuT1X/TtiI0YOmUw1gOqr1YPD6XSOdVS8fqG4quLGIq+ha9mWxFVUyxLIvUK4P4rUG7k44LkG3aqX
X-Gm-Message-State: AOJu0Yz1VExM/FsHh6QkuNNVw+aBSMGYJsAcfTPyDR0xqTz0QSQZtX+t
	Rxkmfx32C3WGVA1a0IUx1USVbW2NflpVo1pI4mD4yvSYGsLIwB3viVWBdAbuY5WoIQpk3OLBB7R
	BBi6HkAJoww0SUDFjc7lwVh1xoxkvZQM/gjVu
X-Google-Smtp-Source: AGHT+IGv3rJkqiUpD54n6yWkIfGJirEOyXcWY1k3pyFgv2WfYQAU27tCfJUM/gCdKA4WU8LQ/SZdpbl5eRjSawdRwno=
X-Received: by 2002:a05:690c:6801:b0:64a:78ed:5cb1 with SMTP id
 00721157ae682-652d61e9c6fmr3982077b3.28.1720059016377; Wed, 03 Jul 2024
 19:10:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87msmyt8zh.fsf@trenco.lwn.net> <20240703230040.90283-1-sj@kernel.org>
In-Reply-To: <20240703230040.90283-1-sj@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jul 2024 19:10:03 -0700
Message-ID: <CAJuCfpFO_C_LgxrRWrxG9o==RRtYAbkbP3ZJULwdmTjDcAJNrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] Docs/mm/index: move allocation profiling document to
 unsorted documents chapter
To: SeongJae Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 4:00=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote:
>
> On Wed, 03 Jul 2024 16:18:42 -0600 Jonathan Corbet <corbet@lwn.net> wrote=
:
>
> > SeongJae Park <sj@kernel.org> writes:
> >
> > > The memory allocation profiling document was added to the bottom of t=
he
> > > new outline.  Apparently it was not decided by well-defined guideline=
s
> > > or a thorough discussions.  Rather than that, it was added there just
> > > because there was no place for such unsorted documents.  Now there is
> > > the chapter.  Move the document to the new place.
> >
> > I'll take this for now, but it's truly sad to see new documentation
> > being added to the slushpile at the end.  It seems better to create a
> > "development tools" section in the new outline and put the allocation
> > profiling document there?
>
> I have no strong opinions about that.  Cc-ing Suren and Kent, as they are=
 the
> author of the allocation profiling document and hence might have some opi=
nion.

IMHO if this would be the only document belonging to "development
tools" then keeping it under unsorted is fine.
If more documents will fall into that category then Jonathan's
suggestion makes sense to me. Looking at the current list, page_owner
and maybe damon might be considered for this category as well.
SeongJae, WDYT?
Thanks,
Suren.

>
>
> Thanks,
> SJ
>
> [...]
