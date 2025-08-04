Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0125D246BC9
	for <linux-doc@vger.kernel.org>; Mon,  4 Aug 2025 09:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300520; cv=none; b=X0+evSPU1TnsoyEydvBzutHvsHsiiAVnBx9p6P/gR1GJygDxvPFpDZp+nAgDBlzrQy9u/kYuRlHYApqkTR7rMnDgRLaTtGI2/VCVaKDKFTahe2SHnMx6T1nIBNqnK243f+HhNvSOGNowijrvzx42puSY1FUoURD8MrY4VlronkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300520; c=relaxed/simple;
	bh=n/Y/9YZ1njq5HqM2pai7gLwkH/R5ARAxjHUBq9em+34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u3u+lKxbW9d7SWzlVG9X2midEfImSCY1uOv7vxwq1Go3wHYfsTBZtuT/K9ToSFBUH1t6DheUjzfdNwI1QRobRcrB7nyFFZSpr774s179AJ3ZBLMtOkKuIE7Ilkpf4fTOek93dFY8xCNNYt2cupnes1gZWlHLKurtTQ1AUIoh/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Wx3uv+rW; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Wx3uv+rW"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3b77b8750acso2642033f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Aug 2025 02:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754300516; x=1754905316; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=73TOCFuo+GREgL2/pYDhxrjBA6nS034VKusSMXRntyw=;
        b=Wx3uv+rWHxmupcwrJYHg2AHdYqjF0yAowTz0jZlosk2f3tF0Q0F2TROBwBv6w3Hlo5
         hcUljCKhSo5dMe5sURLUsqVnNXflcs3C10QFSHklT+84ZgQNEhkKMaPjZXVP7BbG0IlL
         aG8NGkrRtF3aGsfXNEeMAxepR28kX0jRQ/VBh8MM2T9+bmnv4KacPWLmlRKRu+e9AXLd
         obiGNfNvTs4BE8j9IUz0VXCHiLQ7XbraIYRMJcCa/ff9eKyqxvAQw0WORBWAB7rOUTGV
         v/8+ypAfeBJl6O3P31XhLgTmroS06gsCfuzbtTQBIO/zi4GIlQdC7H7HEOrzF3I3ObAw
         nopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754300516; x=1754905316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=73TOCFuo+GREgL2/pYDhxrjBA6nS034VKusSMXRntyw=;
        b=rgSNRnVVS+zWUuBmuEDv6p6LCKcwfWhM/KJSsz7Ilyc1CqORs7cehlrneYlYNxfKh/
         pp8bhwD9OsYfiecaxIi1X8qVTqSgEWR+0vylkByEuTZXdw+wTDh+rByexLl+j8A9k/qJ
         J5kzmJjURXCeqKSrH8DDi6ee2QCw51wX7E09wMoYt6uWavKbHdjWSlagAFp6ei7cYaIy
         s5LgkzxogS9RL97TVgTa1zZ4UfCe96XZiS8qXC8e9X3ShVNfeDpzT8e1Pf+n7Pip9Urj
         QDpeNqa5Z1f9vdc0xl/6Nu4sBo7FgByY2Yze3uwYxfDMT35uHZYcEidhVR4crQhfDtNJ
         l3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoNnR68Bf4CPHIpctBL4wwV9G0Gl+Sl5iba9WzYiEZajrK4Y8TU24u8VtoXIGLDTxAxRdopSKYe2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oWrWFDM0thgCruKdENMv4uFCJwMwzCnjBSOG19rjliBCQJYI
	bdX7q9UHbKt8BsAm3vCGsbeLUaGHiVW1vOsisOkQqrXc9IjCPXAnbK4QErZni4cPNrE=
X-Gm-Gg: ASbGncsfKql2mC4h1wLqL+jrajQpMANmMLJCOdUNzvdV4FuJRwxc+X5zEgjancmjzJE
	g8Et5GP4SG4NUi3h1IV8sOHqjcrzeydDVQZlaWmPf/EntqkZNyHATPm0jWemdQPNutsdIrC5t0L
	IlNS8TTtjszFr36zN4/QcNAjOJOLr6eJNzhp5Vw8caq3mxWcHMz+OZRi/khuN5A7V5si2llodi5
	c46P06kEDq9x0b0KdeWedvLCbFWUS8+s3iScyKFDaA/3h+EIdtiRvn8IUDkESz3EOzyxQqNH7Kc
	iq4f2g64C6fJvPMC1DR7En606ZhQlTQXkls7vC57ldRv/YHLbm+O08anDnqG5uRtCt97Nz+EbOd
	bx+ntXg9NP5UaumllDNZjpQEjzsBjbgD39WThi+i9rV4wrCj2HKuOUtCj12t/FtEzugohi78DNS
	5uTAsRnE86tA==
X-Google-Smtp-Source: AGHT+IGfBJATELMLU0btvGvvdC9Rp47PlTQfVGAhDwVGWZY7ON/ZVUNJ7tTe5soC3xHigILOzKasQA==
X-Received: by 2002:a05:6000:420d:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3b8d959d43cmr7001584f8f.14.1754300516138;
        Mon, 04 Aug 2025 02:41:56 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8394-58e6-9e1a-64e5-71bf-cbcb.ipv6.o2.cz. [2a00:1028:8394:58e6:9e1a:64e5:71bf:cbcb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4530a8sm14894989f8f.38.2025.08.04.02.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:41:55 -0700 (PDT)
Date: Mon, 4 Aug 2025 11:41:55 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: David Hildenbrand <david@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, corbet@lwn.net,
	linux-doc@vger.kernel.org, workflows@vger.kernel.org,
	josh@joshtriplett.org, kees@kernel.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org
Subject: Re: [PATCH 0/4] Add agent coding assistant configuration to Linux
 kernel
Message-ID: <aJCAY8koRzdKigmT@tiehlicka>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <75d86e96-cb18-4996-998c-da7ac0e97468@suse.cz>
 <9afd157a-296d-4f4d-9d65-07b89ab3906f@redhat.com>
 <2025072832-enrich-pampers-54b9@gregkh>
 <1bd04ce1-87c0-4e23-b155-84f7235f6072@redhat.com>
 <aId1oZn_KFaa0R_Q@lappy>
 <aJB8CdXqCEuitnQj@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJB8CdXqCEuitnQj@tiehlicka>

On Mon 04-08-25 11:23:22, Michal Hocko wrote:
> On Mon 28-07-25 09:05:37, Sasha Levin wrote:
> > On Mon, Jul 28, 2025 at 12:47:55PM +0200, David Hildenbrand wrote:
> > > We cannot keep complaining about maintainer overload and, at the same
> > > time, encourage people to bombard us with even more of that stuff.
> > > 
> > > Clearly flagging stuff as AI-generated can maybe help. But really, what
> > > we need is a proper AI policy. I think QEMU did a good job (again, maybe
> > > too strict, not sure).
> > 
> > So I've sent this series because I thought it's a parallel effort to the
> > effort of creating an "AI Policy".
> > 
> > Right now we already (implicitly) have a policy as far as these
> > contributions go, based on
> > https://www.linuxfoundation.org/legal/generative-ai and the lack of
> > other guidelines in our codebase, we effectively welcome AI generated
> > contributions without any other requirements beyond the ones that affect
> > a regular human.
> > 
> > This series of patches attempts to clarify that point to AI: it has to
> > follow the same requirements and rules that humans do.
> 
> The above guidance is quite vague. How me as a maintainer should know
> that whatever AI tool has been used is meeting those two conditions
> 
> : 1. Contributors should ensure that the terms and conditions of the
> : generative AI tool do not place any contractual restrictions on how the
> : tool’s output can be used that are inconsistent with the project’s open
> : source software license, the project’s intellectual property policies,
> : or the Open Source Definition. 
> : 
> : 2. If any pre-existing copyrighted materials (including pre-existing
> : open source code) authored or owned by third parties are included in the
> : AI tool’s output, prior to contributing such output to the project, the
> : Contributor should confirm that they have have permission from the third
> : party owners–such as the form of an open source license or public domain
> : declaration that complies with the project’s licensing policies–to use
> : and modify such pre-existing materials and contribute them to the
> : project. Additionally, the contributor should provide notice and
> : attribution of such third party rights, along with information about the
> : applicable license terms, with their contribution.
> 
> Is that my responsibility?

OK, I can see this is discussed further down the thread https://lore.kernel.org/all/20250730130531.4855a38b@gandalf.local.home/T/#u

-- 
Michal Hocko
SUSE Labs
