Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F43E63A7
	for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172792; cv=pass; b=LVm4xqR5aoFciQiXF1Bl8TDJNYZGjBQbFLHj7wmAfHCgWMntzkw1xf/81vZSSS9PLIxdcsJ3FsqmvebByjrTPohioZY3hmQr0Emk+Appv8Kb+ATKeb2xFz/KXI8IEIFJs6mxFxtjL2OZjM2o3TNcTCdWLxeVgqD7ZLCtVVRhPj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172792; c=relaxed/simple;
	bh=ryFgEXHGkmMuSpJJwpuJTVtwXQi8vggb0ychK1MApVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y1GtLijgpkFojgneuxou/AWYlkF/Kgtu5sdMUHRgQY0yjglvhFSUjuLjF3W6CKpTHD1DG0o4SIMAwk5PgIlD8tACvaeAW7VW0vGpLcnpALPDctN1X8ki7Twlmerb+OUzMkruZoH275wuKCnNTbd7GiyBwX5CVWCv4NxLGLlFcYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=EdesvKDz; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="EdesvKDz"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a7bbe9d0so44576301cf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Apr 2026 06:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776172790; cv=none;
        d=google.com; s=arc-20240605;
        b=frQfggd+r2TvR2Weaz2PtxTgaJBJlGp7EuHG3in/ALmSYCL82wAMD9UHvCzOk+bKUB
         jV4c0wkNb3G4Zlwg+gRxwiX67SQ37xNqcs0R2823+kKSJF81NLEsndFTTY6udbsUBj/g
         B5sY7NuQTaFm/kZucV5+mExbteDpqXYQymhrQqSNE93PXBZ6juiPxesirWQcdZkIT+Cv
         5GNgBPLKl0QsBJ6VRFtyi0yI4h9wMyVtK3WIDG+EL5EHaKwQjx4EibPg4qGqeqJjRGbN
         FbBPYTkinqq9N6af1X4rNPsApriPn/1mkb9X+XzrY14atodCt1QOHLKWl1x+l3ejWLFQ
         TDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+CXxVRVcoz/2rqD2Y6nyYCqWM6bYEnwjERb2zuGyero=;
        fh=L/Ze4Lojj2WHKk30AS+CHn9yjdO6L5E5H55OPtVEZPw=;
        b=MDW6TGZRFcW5nKmcArpb4D/+POfM6mDopmfFyDielWXgSiesHPp6NVJyA/5qdg9rDW
         hnSe/sbWI1uIuBVdvmEMHw9sVPa+UuVsaT13T8+6oyhWqbI7+N/12nvvyZLYjWD68qu5
         T9+MxuP2Dthfr79I/XpIEZM2lGna1xt3sxTtEB4vO9w5C8EepDJ5cdFofx9Yo9U6vIHK
         CaJFJQQgZ2rUM31Ar3+AM2xLopDemJol/5I55+JE9HYSXzIfd8Fg5/2mJxyEM4oADE5X
         PwlD/qVlmY9dlQ4hcX1oToXP4DxpTyUjDlnl1Elg5d1TyF5IztR1mahJrOCh8/+Jd9Ai
         AxOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1776172790; x=1776777590; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+CXxVRVcoz/2rqD2Y6nyYCqWM6bYEnwjERb2zuGyero=;
        b=EdesvKDzFMu6T/NN5owN0NDzG9s+SXgDPUsDbVYCn9yKIf8kwdQE2lTuYVmGiAxzE9
         0DHMCrmYz6U1MzaS5L9krJ64waA1cSWpenp3CcdBgFkMfiSvvJgMJCraKAc1dSuOHo18
         bUw+BOsn4AQvTlcbhfLZdWy6XiGKSVD/tAHlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776172790; x=1776777590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CXxVRVcoz/2rqD2Y6nyYCqWM6bYEnwjERb2zuGyero=;
        b=ZNr+4Vee7oVTQnS/IEwUToZPXbM8JfQdZPopajooJqBLJfF5pYVk6egoWGTmABagbT
         Fj4ni1eMZw4cZgz7+NIBiq8JUSvU22H2sjgl7u2HJSthditn3qj1PZruPmfI6f9LiNNJ
         jJ5dMd0evdCItm4UF3NXlCNfux1GHDmeY+tiLQ17GxNasVSFxU1Gz3pr9JO5scHSEmZ2
         5G6QO5RcRuD5fQ8IHOtbDzEpauAh6KmUTQ7N1DrYByaLwec4gm5Ya9JRNik1R3KaDVFP
         nVNKRFiC4BbHGSYyRPLQV1tetJ1veldSmpBprSn040f2UuV9wT+YnODmi995s/kmheOK
         NgWw==
X-Forwarded-Encrypted: i=1; AFNElJ/JS+nFZXQy8F9621Pw1YbALGJIj2FPtPEg+pdkQV6FqoZB9ie4r+Dk7oVmzUhkDvs7+lJlBSSCI/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YybAv1KBToAcYiXlrQg/+4hu6UVCcFCGaRl910PSkUcGxjqYN0V
	sLo3yJkeAWcjqbQMdcmvyPU1lwMQV/K3JS78eylWqK/mKnSOA4wWBDRRXwrcAg0Jqo/I0Znrkyi
	NifJphGiVlEI3wYcGPjWXMFuD3t/W4C3KR3T3CH8HqA==
X-Gm-Gg: AeBDiesBQ0gVusQSzAEimsoNaMR+ZPn2vjC039Z2c1bhin6GPlE6NkIorPb4/1LuDaY
	+z2adWOe2SXUldYu4KL3rJESrrDw4dQxr77q/bx2uKuQiRNC66JupLrCV273cmtgxsNdtd7hdXH
	rYXqeKMRltPRciEktvUoaFOmUnqGGbshTpCKXCgxwf7JGf8+lP/7v4wgXoo5s7FOnmPFHjHInlC
	bsDbfDIdiOES17gwsXbhklXTBm6baIEa1xbB6GTnUFEeAB1/Kqx2GhqkAjczl+HVA2oNmapcDQF
	grp8JHOm4g3t7uWaBqqiQrbY/eaf/IJ2WmqP
X-Received: by 2002:a05:622a:1114:b0:50d:e471:2d1e with SMTP id
 d75a77b69052e-50de471307cmr196909641cf.35.1776172788501; Tue, 14 Apr 2026
 06:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331123702.35052-1-john@jagalactic.com> <0100019d43e5f632-f5862a3e-361c-4b54-a9a6-96c242a8f17a-000000@email.amazonses.com>
 <CAJnrk1ZRTGWjNzkMxS3UkeZMmrpadJDtWKontMx2=d-smXYq=w@mail.gmail.com>
 <adkDq0m5Wt9YhJ8A@groves.net> <38744253-efa3-41c5-a491-b177a4a4c835@bsbernd.com>
 <adlBcwJjLOQDAR65@groves.net> <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
In-Reply-To: <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 14 Apr 2026 15:19:36 +0200
X-Gm-Features: AQROBzAjmnDDuarHcsoLUx4J604uFTw3mmrQVyJlb1VBhLQLJU1-3tqIq-XH-a0
Message-ID: <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
To: Joanne Koong <joannelkoong@gmail.com>
Cc: John Groves <John@groves.net>, Bernd Schubert <bernd@bsbernd.com>, 
	John Groves <john@jagalactic.com>, Dan Williams <dan.j.williams@intel.com>, 
	Bernd Schubert <bschubert@ddn.com>, Alison Schofield <alison.schofield@intel.com>, 
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
	Stefan Hajnoczi <shajnocz@redhat.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	"venkataravis@micron.com" <venkataravis@micron.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, djbw@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 21:44, Joanne Koong <joannelkoong@gmail.com> wrote:

> Overall, my intention with bringing this up is just to make sure we're
> at least aware of this alternative before anything is merged and
> permanent. If Miklos and you think we should land this series, then
> I'm on board with that.

TBH, I'd prefer not to add the famfs specific mapping interface if not
absolutely necessary.  This was the main sticking point originally,
but there seemed to be no better alternative.

However with the bpf approach this would be gone, which is great.

So let us please at least have a try at this. I'm not into bpf yet,
but willing to learn.

Thanks,
Miklos
