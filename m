Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37487205E12
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 18:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742320950; cv=none; b=GV5I+Q6ux7nUWKBc6C7gsbqVhd/zQETtXxWWHeqEJbvGZYgepMPD0pEzAX0dE0LwaNyZ9tAaQqIV9NkK5DGYiWKWmY9UFsPPlmDM5aG49S8+6JVzoX1bDaVcsSIej1q8iYEmvGGlRhVV10xOHS5HbK1M1DrhwMkKP93Z09ngsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742320950; c=relaxed/simple;
	bh=BjcYVEKKpUzz2FsrjqEYaGy5upsDyp7dXMD/jUWpPEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KOPIyGWCpy2I/pa5HqP1W8NPbrTW2+S4H6TIZW09JmmJuwNiriMz8Z48NyxbZUgJewQPz0Pz6v79HQeA8WuLAewImQNt1yGLXrZiJ5aUlxSBT0l3O5NEcLlBigTsQTVlWzO5OnSbIwWP9Q/AKXGKuJ849Sq+/HYei+r1RGVoz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iWMbp9gc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iWMbp9gc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742320944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qlRKauU87C/lC5/9zx115U/gNR/bBnOd+yZH1lsjrlY=;
	b=iWMbp9gckmGJ406qtMVPceg46E6h1P6Whdf24KlejiBV2LHX2FzOom8ASPk7KNMZY4BuIB
	k4Rs/vceG9XSW340Hra5oKC/KqO8LbfpHg7BAjk33MKR8WlGpA0blcUfqT09e6xm59MlLF
	9vxnyfXJrptLH6NdoiP/4J4IfNx14uY=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-j42DlxmuNF-ZV9V5PclBhg-1; Tue, 18 Mar 2025 14:02:20 -0400
X-MC-Unique: j42DlxmuNF-ZV9V5PclBhg-1
X-Mimecast-MFC-AGG-ID: j42DlxmuNF-ZV9V5PclBhg_1742320939
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e63aad1e67dso9523767276.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 11:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320939; x=1742925739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlRKauU87C/lC5/9zx115U/gNR/bBnOd+yZH1lsjrlY=;
        b=R3x1SO7jqwmGVbm19cbrgLWZlTq0s9MzExjppgWOKJKe8eA9BNgewYouphOCYZH+R+
         XfEMsLtdpcRn6l4chs0aTJEJ3awqeabTIiubPykU5hDp6g2XqP8H4ZIoCUN6vR35Mi0d
         OrqVNizEjO0rC0PH8MsR2BNlQb87mc03QvtKLzu9SdDf2OTVzVtT1N9jvOZsHE5y4+ix
         cxFFwK1ji3FjE9t80IzK+0bhRC9rR8Mq4at+tG8oo3uarCLC49qnTaOK61KY7Ap2vXku
         4MLwLKI/s/qvteySi2eaHGvrPLJ715MKew/+KjwuKWdODOGEDIpGwPiNY1gqfrweca7t
         lNZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHtGqqZ+CTaGgbUcR3ST+F90JtEjOxU9C1AwQvWbOlrrjIi3feqvb2QVm6+HhCvoU1Btpxj6QoP/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJejkKE5cn2KPMVFpJT2IadPiMZsZz/t8oVj8Hq/e+U7uTvKa4
	8SPpK5P6oveNADQ+2srIRfo+wU7lGQwK5oo9Z8rMPMMm576CVYODzb0VsVYvcddF+6H1sbam4m8
	qBeWuFVR0gulM/vLJOms7PDo29gJrYwzqVpQHmNYex9ypXuRrh2bV2/DLd6EazztMyFHzrsx8JF
	eOn3EZGIbbM23gWBAc6fqG0q75WW4wBiir
X-Gm-Gg: ASbGnctapFt3CcPdg7Y6ARF97YGZcDTEj2cddSBHgFEVblgI3k7mKuCatTIFmDj3Gn4
	Vyj2uhKQ61TgMcsvC4j9VL5dXd7iJ4encxThUFyG8thVFvVYooFcF/NiIuzOJo0Es1sDBr5ILWU
	5Fm28iwBbKUw==
X-Received: by 2002:a05:6902:230a:b0:e60:a2e2:9359 with SMTP id 3f1490d57ef6-e6678ef846fmr311876276.3.1742320939546;
        Tue, 18 Mar 2025 11:02:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf71qxvLWsxGimRT+uGjSq1Z0p53QdA8cl8alstSBpREqHbGhALnJb5uq3wRaeZHh2Md4lHGIZ8rqQbUzgZjw=
X-Received: by 2002:a05:6902:230a:b0:e60:a2e2:9359 with SMTP id
 3f1490d57ef6-e6678ef846fmr311841276.3.1742320939131; Tue, 18 Mar 2025
 11:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317230403.79632-1-npache@redhat.com> <e2807c0f-c6db-4946-a731-009d34c2c72e@redhat.com>
In-Reply-To: <e2807c0f-c6db-4946-a731-009d34c2c72e@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Tue, 18 Mar 2025 12:01:53 -0600
X-Gm-Features: AQ5f1Jqld-DTVBJ5lnYhAbXgkaFBEnpnySW3WxHs_U8l1d99uleiybSQ_j4TBT0
Message-ID: <CAA1CXcAr+rjZmzbzHSuvCDqyfi6wW1-32c6_3isZMSr-qM7DLw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Add "Unaccepted" meminfo entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kirill.shutemov@linux.intel.com, corbet@lwn.net, 
	akpm@linux-foundation.org, surenb@google.com, pasha.tatashin@soleen.com, 
	catalin.marinas@arm.com, jeffxu@chromium.org, andrii@kernel.org, 
	xu.xin16@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 2:42=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 18.03.25 00:04, Nico Pache wrote:
> > Commit dcdfdd40fa82 ("mm: Add support for unaccepted memory") added a
> > entry to meminfo but did not document it in the proc.rst file.
> >
> > This counter tracks the amount of "Unaccepted" guest memory for some
> > Virtual Machine platforms, such as Intel TDX or AMD SEV-SNP.
> >
> > Add the missing entry in the documentation.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   Documentation/filesystems/proc.rst | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesys=
tems/proc.rst
> > index 09f0aed5a08b..8fcf19c31b18 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -1060,6 +1060,7 @@ Example output. You may not have all of these fie=
lds.
> >       FilePmdMapped:         0 kB
> >       CmaTotal:              0 kB
> >       CmaFree:               0 kB
> > +    Unaccepted:            0 kB
> >       HugePages_Total:       0
> >       HugePages_Free:        0
> >       HugePages_Rsvd:        0
> > @@ -1228,6 +1229,8 @@ CmaTotal
> >                 Memory reserved for the Contiguous Memory Allocator (CM=
A)
> >   CmaFree
> >                 Free remaining memory in the CMA reserves
> > +Unaccepted
> > +              Memory that has not been accepted by the guest
>
> I was wondering if we could be clearer like
>
> "Memory that has not been accepted. Especially in some confidential VM
> implementations, memory must be accepted manually by the guest OS before
> it can be used the first time."
I actually grappled with the description for longer than I'd like to
admit lol. I wanted to add more but *most* others left the description
short-- so I tried to make it short too.
>
> In any case
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>

