Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B092C3242
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758065022; cv=none; b=CXAGhUUZi1b2L8KmVLYzid0rkTOqjvD8W2UhcVhHamrm2CpJk6TysYzl1/k5GzFSAXnztz53RKGsA4unj9cl+jDdLMBzw9tqcn7IBs49E67cOoZhld4j1/NA+iLKT7aFZwELzulKWpjzwvDdB5c1FkwF0M3n6oYAjrC0YMsNRw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758065022; c=relaxed/simple;
	bh=giTIA+oN2GPG2AJcIuFo/Yqay6xFcr7uFNP4OUqU5dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JQzHjommDFF14LkLRb/Po6k2/0y7XaYYWepgmVH8uxyJklve+OnRPslhJ6G0RaUvPIgFQtKt/ZyoZWEBw3M5kB4Mccvbn5iAbpMeBNOcHddRc8Sz3MUyZdFIcJv2l+WqP/1jGK5rtmFePY/5CdJC/M1lnT8ZqEKxa9J6aulK4r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asyUZ+iC; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asyUZ+iC"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b7d5978dd1so10327821cf.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758065018; x=1758669818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ3YjBHZupiI/fSqsW54w4BEZGVyy/jiIbt6znTHb9g=;
        b=asyUZ+iCHTL//+nR5gSFuJOruC4HPynL2kaTddk7PctWZ9pBCFj1rLQuo1AHwy7TR1
         fRPl3uQNKVDDIgVty2+JobV21FKfGq1F9Vo9nZaN8FLPIV7BMB6ue5fNLgNN2yDrKFZb
         hBDWXJGnaNoy+EAjno5WK7YvdOvXf3+jVe0G9YbZRa9R5cLkNcke/d6dTGrfyPj4XavA
         jv+5Y6N5gGz4o5ZTbrvx4a/EOUQrw96Ni4xSC94Ryef14V7gFonveI61b87xn9ukf1F1
         gQChejVlUnt52ZtsFiJ9IQ3sRoC2TF+l1XDUolQpdP/wkHblopAY71s4WS/3hmLSuDBU
         3x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758065018; x=1758669818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ3YjBHZupiI/fSqsW54w4BEZGVyy/jiIbt6znTHb9g=;
        b=bXhB2ts3+zogk7IwjfhX4+J0BIGV0+fSqQSxDdOJ6eAVqVTRgw2MO8yDEq/kSVeA6C
         Gq5HuXztfyJjYIqahV3Zkt6N8N/8pacpnXAj6d9R3pQbwog+N8bHHMO1uYqj3eGmUeEt
         ooLUeycCWL5uAJlCeYl5epCTSxxVRx4S9zOlyRizOxmaKqtTB1gNqWh+2eN//5EnGYX6
         iubx8M3Qwrhg13eJwWISEX4roLtBhSUX++QdRxNDfOCYPOdb+CSLd8Ta23izyuDiFLhw
         kMmZ0owoEvdTs3cWfVIOYQ4sR6jc6wzBP1l5sC6sDruC54SLC4qyEcqwDtAkaAqALC0s
         d4jw==
X-Forwarded-Encrypted: i=1; AJvYcCW01xFxhX/+ZW578w6x83nC92aQd8fghc+eRQEhHnC1LloVi/+OxApqp7sTtTr2aGfPDwEQxIehDqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7vNeeX/YW4khj1wrLngRn/8FXVFfDV/lcgR3wNLEhlbgXMAZh
	/mMoW0tR7qN1P+nxN1cVWh1LDMGOP0caoL0of7FLwl7twx3sOOcf8dbue+5NbXsRJtTLqV0zFHS
	Bg8IVb4NoqWbopFqnagFd9komlTMlhew=
X-Gm-Gg: ASbGncvVdurZULSNNt6TUxiCbNiwn2G8yA7d3nN56Rd5oVzy+vyHFHRUx9Wle0/njEs
	ZPdy0Bc5EdvCz6Ruafhd4lqUzIWjR5EwSyrW520WWsD/RD7ah19j1tcR20knDBDTm4g2SGt1vb/
	dGe6haSfEh3gqfmnJ0ls5+ZUtO4GtFzIUVWSzFwA4f94GtcqRKbU2931CWiJM4G5JC6z3b7gabM
	r9cSrOQnW0/NgUcLEp3gx4xz/V+g2MEqNnY7AxK2VAI50mTPBA=
X-Google-Smtp-Source: AGHT+IGKNa7p053KroFdDHY8BCrv3xAn02NwZmDseFgEiIugEgF/oIBHgUVbXPtDWUz4HmAdeW9tnpZMVTofJgWdSvM=
X-Received: by 2002:ac8:7f4a:0:b0:4b3:f0d1:bc0e with SMTP id
 d75a77b69052e-4ba66e0cbfcmr3622001cf.25.1758065018571; Tue, 16 Sep 2025
 16:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-14-joannelkoong@gmail.com> <aMK2GuumUf93ep99@infradead.org>
In-Reply-To: <aMK2GuumUf93ep99@infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 16 Sep 2025 16:23:27 -0700
X-Gm-Features: AS18NWBTxeNfj7HS1GZNQzeWa7wYyaeuCFdkWQy1IIWJ1KkRr7vB0nVtSJ8Auok
Message-ID: <CAJnrk1a6UYzY=t-RJtoifxfkXQe-bKMhOnKtnvoP-X1fkPvb6g@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] iomap: move read/readahead logic out of
 CONFIG_BLOCK guard
To: Christoph Hellwig <hch@infradead.org>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 4:44=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Mon, Sep 08, 2025 at 11:51:19AM -0700, Joanne Koong wrote:
> > There is no longer a dependency on CONFIG_BLOCK in the iomap read and
> > readahead logic. Move this logic out of the CONFIG_BLOCK guard. This
> > allows non-block-based filesystems to use iomap for reads/readahead.
>
> Please move the bio code into a new file.  Example patch attached below
> that does just that without addressing any of the previous comments:
>
> diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
> index f7e1c8534c46..a572b8808524 100644
> --- a/fs/iomap/Makefile
> +++ b/fs/iomap/Makefile
> @@ -14,5 +14,6 @@ iomap-y                               +=3D trace.o \
>  iomap-$(CONFIG_BLOCK)          +=3D direct-io.o \
>                                    ioend.o \
>                                    fiemap.o \
> -                                  seek.o
> +                                  seek.o \
> +                                  bio.o
>  iomap-$(CONFIG_SWAP)           +=3D swapfile.o
...

The version of this for v3 is pretty much exactly what you wrote. i'll
add a signed-off-by attributing the patch to you when I send it out.

Thanks,
Joanne
