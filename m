Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23833F8886
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 16:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219892; cv=none; b=oGLXMglTEogdDxriMMzfjZwzd5crUrLGluqN3FftXluPb5erSAKVCe9UGCF8HQJJMxZwZTfmcczFBHBZeDImUHrdf3FdbtvFOap3x7atzw0uAwZPz0uPh7LIWSj2obpfPNlopRJmixcy8hUVy4PtLbgApmj6ThITK/BliHXR2SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219892; c=relaxed/simple;
	bh=3abA9p5dw6hH5BGxr52Cs/3HjcxNfhxyZYCKG2SvU6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSCk9Dd1r0RtRsm56JtET1H0MkcAZW5u3Cgv9nqkMCk5x7AW/aU7V/QVC5c1nuSxIdJwY5+ydZLPcCtUNEsqve5n0AGB0d10BMG0kfyVLxSw6cfZycevh5V+vOCGheAmRwjxuJTignePp+9GQaUu3BOJoybZ8YJrtioEUPRC2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jf3c9USx; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jf3c9USx"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so2151772a12.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219879; x=1784824679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=Jf3c9USxOSBum5mf7jjWFWh0SuuwxU3imgB2uoLinknC2kVBh8MeefDzJ/ppkLlYt+
         9DXZ4T+yGFkas/rQx57QHcUCU0/bPE0a0emceUFSG97ugF4ZhmcnhcVf4JmxoFXTUQ6q
         +ZqLpTdPMa+dfBU6bauTNybl+RKe604f0vM2VH0k76TiSgEx2mwWbtPSiPqu5jJv7iax
         yuV3LtNHjBi6k9yxippBXw3Rp7uJ0zINh4DDaH/SNBWXT33AgOgdYW9LafqRi7CmDj3S
         Keo1+BeJwyrDUT4Sq4IylkBVE7lPcbDnv4TsB7LGQcuZ8EkPRi4iu2FlZQlgDGawid+6
         e2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219879; x=1784824679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=DP3JFu5TrKLEc7H/IH3Cf0MAXeG9NTzyTYUbuaKEcSc4sdqxb1tFMn+TSQOVMNm+a9
         BbwcPamo26TtzMMLqhlSEHQA7Z1eliScBjPupPBXPKGyy381viEeaFZxUf0Ch44ptCU/
         9U3HhEdpjEpOEbJPSTzXBT/ypSwKfLbJcs3SMqpXZNDemFZfqT1GeHhqZ5UE+cRKT+oe
         hI9tN4XL6CyqkXpoYbKvr2zhNqH+J1HR8h5xrGPpBrtcPjaf1mG4cWpta+Wj2pEKBN3G
         E7WEQ+l/usThgDlJYTNCqdMvAqQkkc17cljVD/0YQdzE3QcALwGjwH4QHaVbHk44Aqjj
         vlXg==
X-Forwarded-Encrypted: i=1; AHgh+RrQN7CD8MxSz/Uuh1TgfWeBYrQEwbnszDwGhHQbZ8L+O0SZJcmQTkNtUiIGoxE0jrredQmfsRMzH34=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDSXr8x/EoN/vxkdFBgcA1gZpN9MalZ9mXrVbGd2nmlD3qGnu
	2DOBnjzE5p39lgXacYTXpRNDiIWHx/8pcJiVai3hugMbgJ9X4dHL6oTq
X-Gm-Gg: AfdE7cl7AWETecsbibHqa67uv+F8zdp17yUG5et5lifPM+AwiuoHIwBjcrWUvnXZqKq
	kofbzX6cgSF/YdntnPyZGbgWvTLiMY02tF9FkTkAuonl1ZEAu0Sk2Fdc0q+TOSAEZwHythGRL98
	LlrXneFcKDurMhx0d+PvV6oC676Kd7Gt6BxGrmRD7LDaX7wM3QEEEH/DYHsaF4UVGEx2pWGXd0k
	heQ22yU0xGf6ZLTDJeeE/1GGoTfxhHmP/NA0r21MnUb8f0Sl4pGe39XgaMYbtNwR4dXDzEuBOIO
	M15/VVGZW/fAeneU1NUP+WgvSoJWDmQt5MBbioN1xTVtSkBWH4/9Q89am94QZ6bTFqCkAwojWti
	TdJh74DKXR/jIGbgApmGQ0pAsTZ6+wovW3hGnAcqqS0St70h+2RjiXl5grzZ6H9Q/rjXvrw0cID
	Q9kEk67lIW5OnGm0SMkpvfUuFTrOAh4ecxzsh0OYOe1eFK
X-Received: by 2002:a05:6a21:e081:b0:3c3:7f8f:88cc with SMTP id adf61e73a8af0-3c37f8f9302mr5411998637.46.1784219879218;
        Thu, 16 Jul 2026 09:37:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ff4402sm2078703a12.25.2026.07.16.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:37:58 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:37:56 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, airlied@gmail.com,
	akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org,
	jgg@ziepe.ca, kees@kernel.org, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alkI5JLYPW211Ep7@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
 <ale3ydkx1xt6ruuP@skinsburskii>
 <20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org>
 <e9d0ade4-cf87-4e8d-90ec-50ddb5249b24@kernel.org>
 <aligdOKNwoOtD4io@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aligdOKNwoOtD4io@lucifer>

On Thu, Jul 16, 2026 at 10:12:56AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Jul 16, 2026 at 10:59:56AM +0200, David Hildenbrand (Arm) wrote:
> > On 7/15/26 19:14, Andrew Morton wrote:
> > > On Wed, 15 Jul 2026 09:39:37 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > >
> > >>>
> > >>> Please don't do this, this is completely impossible to track for review :)
> > >>>
> > >>> mm review is currently very difficult based on volumes, it'll become impossible
> > >>> to manage if people sound fragments of series.
> > >>>
> > >>> Please just resend the whole thing at this point.
> > >>>
> > >>
> > >> Well, I followed the guidance provided by Andrew, and I believe he
> > >> applied all of the changes, including these, to the `mm` tree.
> > >>
> > >> Do you still want me to send v9 under these circumstances?
> > >
> > > Sure, if that's what reviewers prefer.
> > >
> > > This is a bit unfriendly to people who have already reviewed the code.
> > > Which is one of the reasons why I respond to a new version with a
> > > single diff showing reviewers (and the author, and myself) what changed
> > > since the previous version.
> >
> > As much as I dislike fixup patches, I tolerate them in reply to the existing series.
> >
> > But having some random fixup series is just crazy, really.
> >
> > --
> > Cheers,
> >
> > David
> 
> Yes.
> 
> Stanislav - also see Jason's suggestion - if you give a base commit then sashiko
> seems to work better. Maybe look at using b4 which does all of this for you
> automatically?
> 

Sure. Thank you all for the suggestions. I'll use b4 next time.

Thanks,
Stanislav

> Thanks, Lorenzo
