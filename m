Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A38D282F09
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779976932; cv=none; b=cVIq/KJ0jp/0IGHAu2zBK5nsp0QscrvokesmEqVR47DlW3x4GbtlelvydwQ4zEB/NtihWAItipN4KDIEWjO86smOyOv9c8xXgEMREMgoUep44KRXkCFVtwiXCvzONP1R346Hmzc2iYipja2+/CoY6SD3lleh3hHMo8xBxCO0dhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779976932; c=relaxed/simple;
	bh=ctasQUQ7+Csh2D5lKCnh27cLT8B7cNdtofVRJ3FVAmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGGiu60QutFT3PxnQp3NPHj/q7+1NYTOAae/+o72QvsXpYs37cganDpWewThfAnhkhtYHziryU3SyGz7G5hQuJUzRDFP8EKMdBTHrpz/Wtt4KKlLAGqcOSUTP0eUX1ynWnxvG09YyK02oWKjCIXBnZQMZU09/GSts3u6K4qB3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoQXGXR8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kMij05pD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoQXGXR8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kMij05pD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779976930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sb89AkexlC8S7MoHF9+cz/eT1YgX2gdgA5YSkoKvstc=;
	b=CoQXGXR8ne6kxyxJL3tWne6z991E0wYQLwxSfU11mI6Q5U1/5Zhy2q3AtjtbQjEb/HSaeh
	AaDMRbGqR+L/xaXnhnPz6viELQSgjSu5nsGgttptPooU0bKydQCpPPkf7NvPoERIzO0tBH
	IW833yCKfVldMoG/R1yA0p2r8jBV1Ac=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-lEykSUxpMA-W6epKn3L4RQ-1; Thu, 28 May 2026 10:02:08 -0400
X-MC-Unique: lEykSUxpMA-W6epKn3L4RQ-1
X-Mimecast-MFC-AGG-ID: lEykSUxpMA-W6epKn3L4RQ_1779976928
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4856fdda8a0so4577635b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779976928; x=1780581728; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sb89AkexlC8S7MoHF9+cz/eT1YgX2gdgA5YSkoKvstc=;
        b=kMij05pDuZ6twQ+Pp3rnFd6qoN5P8GO/7cMfVYpzfAOijzP2b8WYOOHMJKbztlQJcu
         4bOtjd6vuT2Mo87TGxI0DygyLwX+NZY9l4w3roEijdOKpLnXj7DptYM6RIaFxPoTuBXU
         sL3w8irbytOiRJlSUztO86o5xQNT1pn6cfpz2hSxWTAWfpynS3KeC8u1AHuyP3guFJT9
         rkd7x445O28oWn8YDYHKi7uuV+T6gUqiN2o44DJpnrl90sRyCTE/RnISiRATME6goB7o
         /4JhgdclEO95E+ZRA3gMqIvfmsbj64eDYOON59nNzL71boEckxxl34FhNceCNvxTHF+p
         CrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779976928; x=1780581728;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sb89AkexlC8S7MoHF9+cz/eT1YgX2gdgA5YSkoKvstc=;
        b=pRRDZZ2AZPcKdJzeaTDcWpZS0i3fz1rBJRls6/9o4faaPwdpFPjSalw+d61Cz140ze
         O9JH8YKDDsvoawNwZRTdNNVoXKD/oggwJzoBmfuT1pfGMlrfxesQ9GkkaCkH7diAbcjT
         cYku+clzzzlsI4vFiHkjlkswEeGL+tNkhLwXzSVOkTHzb+KMRZFPtVsNp/zWOKXc3DNF
         xrOyNxRISm4aX77B3b477/Y1LScimSzyOxkftokxSot8UYDe9Bi5pi+Eq2Z/DRwj4+px
         WlVZXFv3DT+6tXGI+YjwfHcZ7b/zrHDVtnu6xEoXptfL/JyFVLJiDrF6siA9vzjbJy2r
         5/rw==
X-Forwarded-Encrypted: i=1; AFNElJ/tObu/uQ5ANXqlLx0/EHaOF1C758oZlTuJ1TSvupxBJl6sVTQFKcx4RhJ7aXe+crkcKMusmcfQ8W4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYD2hvXKxDypmJI7GAEG6xm/MqWBvVuqTJ8q+vow9iaVuOZtDb
	lf6jpoX8wg6kWv/NZ9ebz4E7A4ZDPMiXp69sNhW19xo5JHOSjD2DSwHMvBxkrBN2tKH0SXNN659
	M726ih+3WkItbbkheJsvAE4M0yzuL5U4XzfYnH9FZs3cHxgbIEB57HBDPmKNAsw==
X-Gm-Gg: Acq92OGNuInU06fDbFfWEflYsiDW5B0CFBsSyosundRtYspjFcSR3misLWw4h7VFCcJ
	TrQEqZkxk11g+I/q56ANeP9jg1fPmCsHv7IjewxT6vfx1/XKxHz1QF9Of21ThbkgAz4aJ76dRp3
	YXA3qlC5RnXxmLslHkZpFFOoQIwpdIUTXaT0UHgEomKg0ZYcuUrzalc69vrOuVTPYG35AwVvriK
	8IGMeERMsA4kGEnKCFe8HmeLSZvJf2HTtYbO4PDAjQvkmghi6lAviw4dPaGPGYl/5WXOewnm72C
	aQbfh8yJcmN5HuE1ruOly/0w+LvrRFC7XhYn4l4BMfDXob+VOY5uW7zmP+1V320pcFjapgRlO1V
	yGmXs7YrxPPAIDsCQpB6rS6Ai5KkklpKbTIepFRGbSpJGQrMFrdphrvSYIb/79VU5sJE=
X-Received: by 2002:a05:6808:1482:b0:485:5430:2bb7 with SMTP id 5614622812f47-485d94ff023mr674767b6e.6.1779976927759;
        Thu, 28 May 2026 07:02:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1482:b0:485:5430:2bb7 with SMTP id 5614622812f47-485d94ff023mr674628b6e.6.1779976926679;
        Thu, 28 May 2026 07:02:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51706adc446sm72730071cf.15.2026.05.28.07.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 07:02:04 -0700 (PDT)
Date: Thu, 28 May 2026 10:02:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Matthew Storr <mstorr@redhat.com>
Subject: Re: [PATCH] docs: mm: clarify that user_reserve_kbytes has no effect
 when overcommit_memory is set to 0 or 1
Message-ID: <ahhK2nEo-HPgodNF@redhat.com>
References: <20260528-mm-clarify-docs-v1-1-aa88e83b4bfd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-mm-clarify-docs-v1-1-aa88e83b4bfd@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 28, 2026 at 09:45:10AM -0400, Brian Masney wrote:
> Looking at __vm_enough_memory() in mm/util.c, user_reserve_kbytes has no
> effect when overcommit_memory is set to 0 or 1. The documentation for
> overcommit_memory already references user_reserve_kbytes when the flag
> is set to 2.
> 
> Let's go ahead and add a clarification to user_reserve_kbytes in vm.rst
> that it has no effect when overcommit_memory is set to 0 or 1.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/vm.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 97e12359775c..b9b0c218bfb4 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -1034,6 +1034,8 @@ min(3% of current process size, user_reserve_kbytes) of free memory.
>  This is intended to prevent a user from starting a single memory hogging
>  process, such that they cannot recover (kill the hog).
>  
> +This setting has no effect when overcommit_memory is set to 0 or 1.
> +
>  user_reserve_kbytes defaults to min(3% of the current process size, 128MB).
>  
>  If this is reduced to zero, then the user will be allowed to allocate
> 
> ---
> base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
> change-id: 20260528-mm-clarify-docs-76ab8f82826d

+ Other MM maintainers / reviewers. Sorry for not including on the
initial patch posting. I initially missed the separate MM Core subsystem
in the MAINTAINERS file.

Brian

