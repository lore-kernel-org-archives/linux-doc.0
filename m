Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4000B192B66
	for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559804; cv=none; b=NqUrwdbOhc+2CbxUdRzngMjAdrBye71JuFEwKQTdms/j5pKu1vWfHWAgBAmuzf0mUHWQHRh3kxtOwthDR+qHF7lh96mTf3U9xNF0L4F0zY6GvFudpVcJSofYB1pRpCto0kgNrjEtgEPU9qUUOzO9dVF+CMHu1nnxTEnMXWubOgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559804; c=relaxed/simple;
	bh=m9/XGEHINrVzPTUGiEZBd4c6Fi+tGqA4JccCjRyRcuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSRN2I9D61NJGzW3Z50Z4S+u9B6ShiLlWaQTvpibXGAesXG/n3b3nJwqE1xjoFItnMnOEjxpBTi8gXtBd9crIso0Wqlcth8Wm5eoLO14o1yhna/ZPxygPXpHoPFyvrR7hRNakZ1KJKORP3GL84j9pPQnihjKL7GzPFpUSwFY6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFejKAtP; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFejKAtP"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ca7a71adcbso10505551cf.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758559802; x=1759164602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA+alynuVVEEPnntcyqcLLSauhQLoM8gOAgbz++kC00=;
        b=RFejKAtP74up0mb6zIBo/ztzZ+Sf2255tgJnRZKBv6pqR/bH128weEJfGas/TXV/TZ
         9VEqSf+YbClXEI6WiXooTNJbGCXE6u69aSZ6fFDB+NJAHH/iXXUw81QlAs3nMCxgifOb
         m2I+HzjucroSBR1eF8GxhI/vfpwitPSi2XX759NDy0WTS0UecXOTEx/OZ0q6HIZQstz8
         zafcoOd3ah8UHBlSpvZZRSjZfvieU52eCiHotHgOlF2AIq6WSb9HkuxeOrfSuoXsvYwi
         h0Giq5fnu5RjVNjrlFAtYL+9Q38eilZ6EABhXmAHZ5g0BncUcXhVA0RRigGZ5A7WmMhK
         r21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758559802; x=1759164602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WA+alynuVVEEPnntcyqcLLSauhQLoM8gOAgbz++kC00=;
        b=YIqtLtBoNu4w6vrl11JrFcFEnfzS7bXNvGDs+eKDCS5cB0S2LWDPhl/dZgKHS+UjyU
         f7bNIKNiYpNbmr03lL3gkk1W4qAF0UZ436rc5kzY55E05JhFRMxaJ9BRuJKpdSEYv/TQ
         RYAOLm03KXslPQ3VrNFzKFHdzcDOMBHHsd+CjTroSTAnaQpXiKYTwBykjb+5NVrcheqo
         Dvw0hcPZe70Xt4gE0lkaiBqqSokiUSlnp/RCESPBLeINTptC+TH72zp1gZ21pOCEogJa
         xM5623eYgNgkeHFLMCVczxc49TtzVOM90hbVy27imQ1l1yYPbvBJ3oGs8+7H2E6y6RT7
         iFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgH/uZsiyc8VE55rTPhjpAfgD0mgH8rUq4iVkq6FPjvXLDwLzn1kqXfgz9WZtsucssilAp3NyBW4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEpQmu2JrnR/33hyTMCxJ9icWfw+BszHyNZ+xftg1eE52K7QB6
	1pe8cYfGuBnq6VaXLbWFOJvIyXcAjwPscWiXDGOXU2KbhAzhPI/2BpXZkOj302FgaPgoRkUNsYu
	j0XsitEaHaJDEcU+Y2/23acQcm/JEYFU=
X-Gm-Gg: ASbGncub9bBY1pS/Yk26PqqzUbc+eAvGtopgu5khlpYRj2HOhFr5vCmp+rsLosIQ0fv
	frw9HO+xnJ0foTEvdD+oQKItSC0K6hgdPjKlxjJesb0CyGBMlcuGFZGlJUwk064m2VKUYk7zir1
	4KTVOYFzI5l+xirn78HEFRuQ9xstaRwdy5LfPrSDov1pD2zdW4v/HIk6ip609GMvYtNIYyzmxJe
	YopEkbyGTXxHZP0dxieehftpz+Q+NlnTxBwuPT3
X-Google-Smtp-Source: AGHT+IE2GJniwx2CuhW63kr8BKynTNE4Xt9Ay1AkqcPL9FzvjlWdOzfghumDj+pZeJOeKep2YblFDfteGq4gqyUOwfY=
X-Received: by 2002:a05:622a:653:b0:4b7:a62c:3747 with SMTP id
 d75a77b69052e-4c07151d134mr177156361cf.46.1758559801973; Mon, 22 Sep 2025
 09:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829235627.4053234-1-joannelkoong@gmail.com>
 <20250829235627.4053234-6-joannelkoong@gmail.com> <aLktHFhtV_4seMDN@infradead.org>
 <aLoA6nkQKGqG04pW@casper.infradead.org>
In-Reply-To: <aLoA6nkQKGqG04pW@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 22 Sep 2025 09:49:50 -0700
X-Gm-Features: AS18NWCYGl8IVCOH-hPpOfmVBaFG3jn-gUPUQCOuCGVD2SlbTPYRIsrQjTCDT5g
Message-ID: <CAJnrk1ZxQt0RmYnoi3bcDCLn1=Zgk9uJEcFNMH59ZXV7T6c2Fg@mail.gmail.com>
Subject: Re: [PATCH v1 05/16] iomap: propagate iomap_read_folio() error to caller
To: Matthew Wilcox <willy@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, brauner@kernel.org, miklos@szeredi.hu, 
	djwong@kernel.org, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 4, 2025 at 2:13=E2=80=AFPM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Wed, Sep 03, 2025 at 11:09:32PM -0700, Christoph Hellwig wrote:
> > On Fri, Aug 29, 2025 at 04:56:16PM -0700, Joanne Koong wrote:
> > > Propagate any error encountered in iomap_read_folio() back up to its
> > > caller (otherwise a default -EIO will be passed up by
> > > filemap_read_folio() to callers). This is standard behavior for how
> > > other filesystems handle their ->read_folio() errors as well.
> >
> > Is it?  As far as I remember we, or willy in particular has been
> > trying to kill this error return - it isn't very hepful when the
> > actually interesting real errors only happen on async completion
> > anyway.
>
> I killed the error return from ->readahead (formerly readpages).
> By definition, nobody is interested in the error of readahead
> since nobody asked for the data in those pages.
>
> I designed an error reporting mechanism a while back that allowed the
> errno to propagate from completion context to whoever was waiting
> on the folio(s) that were part of a read request.  I can dig that
> patchset up again if there's interest.

Could you describe a bit how your design works?

Thanks,
Joanne
>
