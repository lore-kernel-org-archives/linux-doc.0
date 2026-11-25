Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623695;
	b=N1Eqk/OoeZc2CaGvjnyuHAzdwOQC5/xkxCljRxQK838ViV24P+FFFUrlA/yUXo74Q/7o
	 bFZfy6+iYUsZVMcvktUDX1OfQDdydoF8ehJ2RUuV3c9WKYSKvZmxqsPYL2CsCUb3n0gKM
	 MnsWn/tY0lmYN9genimWPXwpeTC02Ny7ZBPeqLjlf9gFugLx6QLYYLHwM9VuK/8guIjHC
	 /7EjjuJSkrF+Pio6YzqRFt73CfvD1DdCdEJt8C97lVwIfy15mRot+09PhMAOtImPpNkwe
	 CM7Cagpu9jvZoeRolfkHilKpzvpQxsha75HPAc5h5ij26tFx3vNCCHMIO0cj8Mp4RPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623695;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:
	 X-Pm-Original-To:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=sRMctCIyHFl/rubK1Zvyz0tzvLwm3/RXHacDMmrLKwY=;
	b=U8ht1hvkBricjOaZ4OwPyeKS3PKdjqzBCAPLaMNPPPlz8tsgBSVHRoQOxyBV9BSzjWx7
	 VFxPCBgd5FIiRSbxW3N0gSQVFrFMnKJJQrZQW0fLm+hXX9uN3zQqdNexI+hniwffzNUhF
	 hjtr3FkdLDDE96519ADeDtE6aZ6gC8t+Jd7iRHq70dAgPv5FbzA6tWnPyts2CVhz2JDIn
	 lYwGjaHbuEu2+tJLza2TWo6BHzxiTvj/YDxMUqA23iEU9/oiKi2XtRcv0N3tyTm8c1uYr
	 g73U+eajJ/hsRa0M6ODup6KUmuBZ64EJIKwogGTTZjzEpxEeefXu/pG/SsMFPWi6j/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=atomlin.com;
	spf=pass smtp.mailfrom=atomlin.com;
	dkim=pass header.d=atomlin.com header.i=@atomlin.com header.a=rsa-sha256 header.s=purelymail2 header.b=JaRz1fVk;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=I4jXZS4T;
	arc=none smtp.remote-ip=34.202.193.197
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61004606A336
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61004606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=atomlin.com header.i=@atomlin.com header.a=rsa-sha256 header.s=purelymail2 header.b=JaRz1fVk;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=I4jXZS4T
DKIM-Signature: a=rsa-sha256; b=JaRz1fVkCfMLTnnLV57pzTTK1Ne42yfaj1IQX7jkKpXoYRm2xfPAeUWitfuGkVkuBkYPfwSQi6GVts1W8ILi/8fKG3fd6woyrygZcvrYMGO7+Fn2m7PsE5NEAAQWDIe8LOPCpFTgKzb+37wUWO8o3cB/9juGJGuBJnrD6oQBmjCT31iFtD06jOAPhhADuPk2K1hJ1TsZXt8Qc5vvB5o68ViOziNwX6cg0TC/LADlzhNY8k4yJwlinxgWIBmNZn4+GpacEOD0UoFqxgmRwPcJ3HE/Q0RFp9wdO01pC6fjTgJW6+iYGA/Lp8ajKzL0zrgJzKFi/maclLHm/2t50hCoQg==; s=purelymail2; d=atomlin.com; v=1; bh=JpXvq6kgsv07UGUTorie+7FWgV7cwV+gGchX02qK4cs=; h=Received:Date:From:To:Subject:Message-ID;
DKIM-Signature: a=rsa-sha256; b=I4jXZS4T8UIPssnHu0O3SGNngfH1JK0VCZY2wnvzTqpBZZkwIKsLrgxuFaCz6RFMXLvZVACSGPonpZlXOl03dO4uxIlr7kANcxRRizZp5ka9Me0Jfp7YIsQrW1fvILuU2VN92x6pDsgjQYYnZHVvnU1PmFtKpFsQf8c907Tbiwm9c89SXcKpiCt+KCjq2LcK+C6LfPSEz0qgPjS7PJK8nhfDV0Vv9i6FdgMBR58smK5k4ILe+4mXr9x9v6ehlRFk4TV5u3ZYV7kHxxW7HNgu42hvDGvau202rfSyErr6hQmyAzb1aArsuZUk3f+1ZkSmkMIsEyoEzKy4uChAJe5fDA==; s=purelymail2; d=purelymail.com; v=1; bh=JpXvq6kgsv07UGUTorie+7FWgV7cwV+gGchX02qK4cs=; h=Feedback-ID:Received:Date:From:To:Subject:Message-ID;
Feedback-ID: 1802931:67223:null:purelymail
X-Pm-Original-To: linux-doc@vger.kernel.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -217530310;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 25 Nov 2026 16:20:17 +0000 (UTC)
Date: Wed, 25 Nov 2026 11:20:16 -0500
From: Aaron Tomlin <atomlin@atomlin.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: david@kernel.org, corbet@lwn.net, akpm@linux-foundation.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	rientjes@google.com, shakeel.butt@linux.dev, sean@ashe.io, neelx@suse.com, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH] mm/oom_kill: optionally log victim command-line
 arguments on OOM kill
Message-ID: <4gedpy2buvhc2urtsabb6kz56f4s3njwvjmxbd4whpz2bvgv4s@visad5hfhylk>
References: <20261124205043.1010247-1-atomlin@atomlin.com>
 <awb6I0qAySbhBIsW@gremlin>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <awb6I0qAySbhBIsW@gremlin>

On Wed, Nov 25, 2026 at 03:33:28PM +0000, Lorenzo Stoakes (ARM) wrote:
> Nackity nackity NACK NACK NACK!
> 
> This is terribly, horribly broken both in concept and implementation.

Hi Lorenzo,

Fair enough.

For context, using mmap_read_trylock() before queue_oom_reaper() was
intentional to avoid blocking under oom_lock, which is why I sent it as an
RFC. That said, I take your point: touching mmap_lock and walking page
tables via folio_walk_start() in __oom_kill_process(), along with the stack
footprint and adding a new vm sysctl ABI, is the wrong trade-off at OOM
time when dump_oom_victim() provides memcg context.

Thanks for taking a look.

Kind regards,
-- 
Aaron Tomlin
