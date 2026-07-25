Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479032C15BB
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 04:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784952106; cv=pass; b=TdUwCACCv+gTMffDACv7dObdNLD9DGlK3zH6YH0M4sI2pSY41moCCrU4TNYu4lQtaokztdeqy1QlEertX7+XVW6vJpohXY3MMFpuXd7rMRDufIQ6AeimGidhCcITC9TfpvaghHCJkGyQrQtGpXJpBndWhWmJ9QqIYQhTwsbO6fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784952106; c=relaxed/simple;
	bh=fNC8wElaBgCywizq8gsw7GvnGpxJrTKPY2EQunJ50fQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUqQn+/mNlh+TObpWCPAfXD4ClXFuX0Joh34HFLae7PvH6keG4kR8nD+Qsc/FS5pTmHnubqBSSJ9XdvBVS1/SDyJQAU6caaUOnI1mMJUQrSsbCZhjSXpGk0tJMwJQaRgnXEEFj01mbIjTxLCxln0kMybJSwkCpy1TdMHO/uQyY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CNAZJoN0; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CNAZJoN0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51c15bf5000so7547681cf.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 21:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784952103; cv=none;
        d=google.com; s=arc-20260327;
        b=RVoXEetEEEHlXxZN/vUp88HKZO38F65DukXT5Fypo1N4q0NHsf2iR6duBbflHdqhhW
         RBUQqW5nnbB3S/ufjP9i82pev+685UGrwPTqq24TqpQhIebeu6lvKza9u9Fay6X6KUlg
         mAlSXR6oVBgz4wuaBBNWRjrcr3gz8H4F7NNqYK3rcO0/Zq6mN8CJ2hHgsYKkp9mYgBHz
         9snPhe/zfNkAdORRrKvalGUjktmF3Ucj6+ZWKdW+7KMojvt3puqyNaqeuTO/MVjDehVn
         w6n1ctYXdKVETz8c8OtNohrT7xw+xEb6Uj57mh1Xe1vrghSeJigsw0fhvu7IlT36R/pA
         TN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        fh=Ang2VsuWFk9croT/Ur/EP+14wjGPf958a2bJDkres8A=;
        b=lFs3SpBXYHiNcBy0ylKs8GzpBJb3iJ2LFetPJhTMpKrWsYOjuFmSwB3en3rcvsmbzZ
         VzfUxQwzRUSAuqUxFoXSnAU3yq3bikEBrYXRM4ccEADU+6L/T0NMS+T+/skxXmKlABdw
         Ef/GR7ydTb2CScQtUyw8oHo/OysAVjvjl9DxGxZklzwZdCfPD1YxAiJWcf12B6jDS2CE
         x+7vUTVHxYE+WweGDbNkrxj4zEl4igeN1O4bQ61sWgifh3VPxf2mdxg4gwqLffqGiJlp
         LZLXaCouAcSFr67Hz/hmxvw0jGaKLK+x1Z6UkJpKhH8f0w8xCHnCIUGwaFBIEeUdpuIY
         BJnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1784952103; x=1785556903; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        b=CNAZJoN0GTGYkkNaC+LQwZa9ZPYftYSqqF9YnFNyEv/DFmrM+msE4JBCrJb/oKRqVL
         hih2RSoXP1ImRcm7kDGVqmiKReSP64UzzbzY7d6sGRf3Iz+pK7OkARtstKIc9iL9J3Ko
         Jfb6ddY0nBEAbcuBHouUYHej58F60A0BJgcIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784952103; x=1785556903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CzPMjf6pORP572iHiiQv3possHTxsjbSzVUS0tfn1HU=;
        b=XgrQ9XXRFfG+KIm3XXO48c6zYGdm3/fTJRtvRRVNeUkV9uKQJ+MgSb5zVZC4m+VF4o
         2sXDsY0SVM1F4Db8DLOJjsja5cKX138mY0C+CmU5ZU5UhUVZD+M/6UAoB5nNZySSSJ8J
         /Gdvj8eNWqga6R03Rni26lsMeVWxGMp3mnXAcUEM4NDpyCsXTU2T4aAIc/VUj3YI71bA
         G9v704Mt7etTzuQrHz0V+CIPadKnjYPq0W1rFu60FB1YPn7Ba9/4V99USSlhY7umXpeB
         XcCclBxf6zJRHMuuZfUZhqrdCIosxDXBUGS/X+cCroTknAefMOg3GXRqtQTekIRs4vtB
         dpFw==
X-Forwarded-Encrypted: i=1; AHgh+RqcTG8GlU4pfVA8l3s9nFnBy+b++qL/JVJcYTsInBhXLWzRHp1aAZt8epWSXfdlM0570eIFpM6RqX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfaJmxrmaaWzdX2VoqG1tHZLkQt/hPkVP3L0I8sFEMWQFxkt3
	0O5ikqhNfjZEp9UL6cKrQJLa5roxaO2mSKFKmheF9QoGy2bszv/+xKKNoOjOxUx8gPhlIqRDR9a
	gAnjRq9FZRF6Ja784ZjEO1MTWZJqcLIjrMGtN0s29l0hQZi/nv3dYj/U=
X-Gm-Gg: AR+sD13Ge0nbxnHF8iKYIN32v9IOs6KpQzvkMBJCF47hLK0HmkWSVHz2bNVA7MFnZ3a
	AIROC9iI2EzXTK0Mgg0CI8yUyRAUbIVeEqZ3IVC7rov2GL0hxiClXoOtcAM+lCSHhM9WmLVC45z
	jshi08xrK9JYYjBmQq4WZDX6WD2SXkxp58vsjxRAmQD9tlt52SCxuO1WC1FHO+LFLJYiniw8FQn
	x3ayH55/LJVFhZ4G0JP1UdxCY85sIyRmqZ+G7bqdMoih07XrOyJ+Bt9nbkWmFu/QeLIqb/e5Rf3
	n3NK6WIgIJFJGmec
X-Received: by 2002:ac8:5c90:0:b0:51c:7b12:6001 with SMTP id
 d75a77b69052e-529a8714e88mr10045521cf.77.1784952103086; Fri, 24 Jul 2026
 21:01:43 -0700 (PDT)
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
 <CAJfpegtnja6tkOnNPD2WZxu14Dd+UM9AvynsVB_E268iSXLbkQ@mail.gmail.com> <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
In-Reply-To: <CAJnrk1a9mR-6hFie3hfFRgWTkrhJMVx4j9e7WGnjTRFuX2iJOg@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Sat, 25 Jul 2026 06:01:30 +0200
X-Gm-Features: AUfX_mxAcvr2jX4Ns3aulDhtsSqUabRQhwz0VnV0bbRi_FBtOFn1nR0cN_FIRKA
Message-ID: <CAJfpeguEptz4sEXq=pBWPFop--1kTDu5p2yZnCyzXcrZ28Nekw@mail.gmail.com>
Subject: Re: [PATCH V11 0/9] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: Amir Goldstein <amir73il@gmail.com>, John Groves <john@jagalactic.com>, 
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

(Replying shortly as we are starting now on a two week journey.  Won't
read email during this time).

On Fri, 24 Jul 2026 at 22:23, Joanne Koong <joannelkoong@gmail.com> wrote:

> imo these changes seem doable for making the 7.3 merge window. I'm not
> sure how much bandwidth John has though. Maybe one idea that could
> work if John is completely slammed for time right now is having the
> changes requested above be a separate followup series someone else can
> do and then this current series (after the sashiko fixes) and that
> series can get landed together in the same merge window.

I'm all for it.


>
> >
> > Maybe the striping setup can also be done with a notification.  The
>
> I had interpreted the FUSE_DEV_IOC_STRIPE_OPEN patch as implying that
> the mapping gets forwarded to the kernel through the backing id in the
> open() reply, which I think is how Amir had also interpreted it. I
> didn't like that the striping mappings got sent through an ioctl while
> the simple mappings didn't, but I think maybe the patch was not trying
> to suggest that and I had interpreted it too literally. I like the
> striping setup through an ioctl - I think it makes sense given that it
> is connection-level instead of inode-level.

Yeah, the striping setup is on a different level (like we have with
regular filesystems).  So I think it's not that bad that the setup is
different.

Thanks,
Miklos
