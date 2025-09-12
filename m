Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198807B3E1
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757694496; cv=none; b=LJFkBDhyISw5fQuH5tsoHTuUYqkArpVQPYKXFCt91/vAb7Hbd1DmE9E1bLURYq0c6mvTllMriMKsttfWexBb/4pc0a1dcA5nGF307mKPYdPkocwqjDQXEMcGBz8TYGTazWuMKK68HjIJTTc6bPvI/H6I1NeFJ6Sh9Vs6kQuQT4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757694496; c=relaxed/simple;
	bh=4ZQds+rLQqXKtrUuxNGp9y/Vi70dhfBppH9lnk7gdCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1cOCLXjtt11IJCy6GWXSvelGtaJ3e28pJDgVw7l5g69LuhoZ0aBW9XYAEO5Fs7RIHG9aSGX+IDc2Gh6iBit3omtjYoyqSkAYL0CvkjI8mWpn595Pbk1nlAMAtlAFiyNnyrjX4yFn/5NJc/KHbfbgun8W9D7wqaWr9JdpGQJTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDuJXpnn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDuJXpnn"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b5e35453acso26406021cf.2
        for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757694494; x=1758299294; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZQds+rLQqXKtrUuxNGp9y/Vi70dhfBppH9lnk7gdCA=;
        b=fDuJXpnnzZBgy62qA/zbs9nS//r+43P1NYWcv/V/VdowLoQ0o+SChONYShoeUoHeFG
         ygtVQvDW3+mH6sVgUEN8Im4BNY6c7xRwDyz5wC77cSNb3is9JD99KRJAAkhxJTLNF5Fr
         e7gdM4MIJh2Xt/1LSL2v8fOyDPSDq2GwTCpQ19ehQlD/Um2NGuPcd7i5JjsimIhAnJd8
         5eqNOK4/HMp1CoRFSw7gzvJM5tz/vHuwA2gwF59L+TcS4P7q/2o57vgpUaTndAuv3aIP
         /CA/+3Sfyf8Tr6xR2O4tuqrPzrA6gRJkJZyjTL5B1G72SweM9EOiV5N2UYr+PGo9xveV
         bSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757694494; x=1758299294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZQds+rLQqXKtrUuxNGp9y/Vi70dhfBppH9lnk7gdCA=;
        b=KcJL3ihp/pK+T+a3AeDzXKMUao/ZQvy/s0MYa/nPJQGW5wvW61ld05OR9SkQKeji0o
         ho8UsaOx9avIfXGVXVhy1wDHernCGFxftTLPdR7i7WzyJIslVnW5A1kHn0q5vknQI6VC
         5PXfKDeUEGSKEJ+wgin6hk6rFlETSxssmRxfFZMDgAaEtFBM4TzlmEzVJWo2xH+B6l+E
         lGpPy2rE/EDXbTkuiopByHS7ifdl/Rh8VTcyzU8MLz/GOZDXi3EYPvt/FFK7yIsJUr2J
         ScV2vvMa9eFD/k+yUWQwx792VLcsbam/9A0JUmliL/b+5GE4lNrcXS8is+cENuM6WJRH
         8HOA==
X-Forwarded-Encrypted: i=1; AJvYcCUYC4PgfFsOyiEVx1E5nLla24p6DjqpxKy7Ev+tdLSXFhUIDcPRVgvmB9d5wldNowdHIP9ZQ6D31HM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrShw+qorGfoFN4MJIIwvllDwbiV/EqK0d36j+YpCGLNUuBl/N
	Q60yHpA/pOATxFlGIGFkAN2VLnTJhIHk7oAsGuBJ+OsO/z0RrTXwe+i/caa9FwgcTwz64Fq3zQ8
	C5KjOcjxyJnFQD60nIf6iDRKvOG3y+sQ=
X-Gm-Gg: ASbGncuF1J5On4ZeBfERUCC6KCs9tMFawXUVs0NHgro0vXOrOXpbAjEDYgpM/kb1USJ
	EHk6GDuNKUAS6vLlrvBYtEpIyGZKwvzsrTWX91+Feps0kLvlsVT9SI4LIvH/XRU86h4N5xXpWUx
	GSy+ReOfELoXaETMRh1E/CtPfl16cHkQOu0/TgTHRDxKhi6QBCsTqnyN3vTA+HGanKvwL7QI4Ig
	XLAk/8x2dP0LU6Mj8ioIIVqAloMKpAafRehdTLrAI0Jk9v42Jcd2qYNczBEGCE=
X-Google-Smtp-Source: AGHT+IH3sgRSs+dcbMoU7VA9j2cW53LQyv/IZLN7O9xGcrcKIirLDxNle7DY6XecZsiCSB6AFLxXPVP6mp6QV78ZXRU=
X-Received: by 2002:a05:622a:1c09:b0:4b5:b28e:f0ee with SMTP id
 d75a77b69052e-4b77d035872mr40986501cf.51.1757694493815; Fri, 12 Sep 2025
 09:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-6-joannelkoong@gmail.com> <aMKuxZq_MK4KWgRc@infradead.org>
In-Reply-To: <aMKuxZq_MK4KWgRc@infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 12 Sep 2025 12:28:02 -0400
X-Gm-Features: Ac12FXxFDjN5YQNfv2vrM4ZDEgMv6WgrZBCDj2pFB-Fs02NqF_4tIokmTzA_qak
Message-ID: <CAJnrk1b8+ojpK3Zr18jGkUxEo9SiFw8NgDCO9crg8jDavBS3ag@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] iomap: propagate iomap_read_folio() error to caller
To: Christoph Hellwig <hch@infradead.org>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 7:13=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Mon, Sep 08, 2025 at 11:51:11AM -0700, Joanne Koong wrote:
> > Propagate any error encountered in iomap_read_folio() back up to its
> > caller (otherwise a default -EIO will be passed up by
> > filemap_read_folio() to callers). This is standard behavior for how
> > other filesystems handle their ->read_folio() errors as well.
> >
> > Remove the out of date comment about setting the folio error flag.
> > Folio error flags were removed in commit 1f56eedf7ff7 ("iomap:
> > Remove calls to set and clear folio error flag").
>
> As mentioned last time I actually think this is a bad idea, and the most
> common helpers (mpage_read_folio and block_read_full_folio) will not
> return and error here.
>
>

I'll drop this. I interpreted Matthew's comment to mean the error
return isn't useful for ->readahead but is for ->read_folio.

If iomap_read_folio() doesn't do error returns and always just returns
0, then maybe we should just make it `void iomap_read_folio(...)`
instead of `int iomap_read_folio(...)` then.

Thanks,
Joanne
