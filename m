Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938594FD27E
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 16:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169159; cv=none; b=VUvPulEQPFIaAR27QiDQtljRGDO4LQFgnn2lmNlBo0GKzoMtuil+ZFQCZHPDv+4XEc/2R/FR55Omml4TEqsPPEWXUC9Nn+FNw24QKgh+blGKe9uyc+KFdKYkaG3HehgoBPq0a3MCqc8vunpMq/ITWjDhGiIuiOorNc/uZp1QDvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169159; c=relaxed/simple;
	bh=yWna3LGyk7AO4Z3H58l7fcPnAfl+aPw+asBmvCYoCyI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=mrEaV/sXuLv5npLba4yL1+4R6luC9PUkHnAxtNfgTJy6DbAVGs+o3PDdvKvKVQSP+MmlGXP20uze8jD9DZQJISJb+1KAfoQDtC2MUUNX+/SXFtg7NvnoKD1EUecCo2RX/HrgO7GsDW6aIVdZnDwyXgcS537LGyB9vIuye25fNIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAua68YK; arc=none smtp.client-ip=74.125.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAua68YK"
Received: by mail-pz2-f8.google.com with SMTP id 41be03b00d2f7-ccb794ce92fso28217a12.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792169158; x=1792773958; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yWna3LGyk7AO4Z3H58l7fcPnAfl+aPw+asBmvCYoCyI=;
        b=lAua68YKeHbe2WuAXxRhzGaclzV0HkoPwz+6k3NnRzmDCtTD/1bNeIwG/snF/Kj/oS
         CXRFdU2Lu3nDyarfoj+mUkknv6YzNdvl4gPpzv2iTmK1oAOnvr3gj3Xxvnl12V3O2bNi
         3NSMA+zpNI2IkVdrFAvs8ALeSHL6MKwxjZG/Cxoz6kEdrNyE3kXlM2QbaXGQedRnMWiM
         xBB7yM5zBo6SAAjc9epHhn3CV9gyDD0361H3j4pJrfD9S+WYxQNd++NTOYNivMNQ1qvq
         c5TuHGsYcL7m+HHBVnTpy3cOQgCvxMNb1eAFH2zGHVQgAKMojmbo7wPO8cSrolmUDGdB
         ac6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169158; x=1792773958;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yWna3LGyk7AO4Z3H58l7fcPnAfl+aPw+asBmvCYoCyI=;
        b=CMo9ncWHENZmvrNhkBWa1EmuZNLt31kpMRgLpg9icMJc5+64lK13gN553KwRN/dcAA
         tx6NXZ8uIIrsJhDg/cN3z1svFkcy3AHwyCbulVZmGPU0lPRWNbGZKOPFwVkJDrhGcK9U
         YLn8RAOvQ7uGgzJUVBWQTBkcsA2FaYuNHK8n0n5K7TScr7TMn2CHawjopdl/U+6+U3Da
         NH/Ldv38YukStJKcp+4lqN4emjsyabxgXnUGhPZC+wb0s7a6DY+ncHp1HUhvXyTfKW4N
         SoW8btw6PZdDDFrKTpu/aMU+SNWDUR8ydX0A2DBsUq8UcdDE0QSpSI41Upi8b1WLQI8v
         FOTA==
X-Forwarded-Encrypted: i=1; AKwUvBw4KQLRfa9lK6o1Fha4QmeFedhLCkwb3qqxHQYEKEumWDnRyxmvUB/vfUoLPv43WH1+ryYP05aNnm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmZ2fN0q15I8ElYp5cl0CfgFP5NzO0ZffR31i6ZKZCUp6903U/
	MjxqoMuCH365uPvdXiTRiikvjelPvIU88c45ag5reiGyhJycedm2SfwtsIrUv2yZeri+TAp3zhc
	=
X-Gm-Gg: AYBFou2PqOrJ0bzd3uwuB1TsBeKEqQ+jBcWiuG+I3j8fNQjohTNis349LPqPc5a7aUa
	mrPDMjSlBc3KqQO2Hy0NLitgsDd5bwlxa59SQbGVuFQgkEm3IRlkdmfk62v676yVQ/xvybTQFHV
	Wu+SabJFrJ6Gwtd769vEcJl8dEv5n66uNO3Msk3Tfut+wL6LMH1x0qAk+KFmLdvnoSDVRk/Pt0+
	/m1K6ILU56mWWP4ecAX/gn6wJ5WBBUiDcmPUcuIVD2lBtlqkfghstFtDdNihwlytVJkVAaWD0wp
	z3QzGuIcVsH9Rwl1Kqcrq7VpM1I48UpQIlo6RjSyU3clmC6TSWsK10Ey3wNq9QUqY85i4h17N5Q
	L1WHnCYjv0soS/V/N1AwlliZCaRdcPJso68lIfHyrzFQIeBB351juF/YcEJj1SKwOtemDRe1PTl
	nzaJjyDndHdYCu/VIJ0/FQpRXdFWtcLVA7JQIEf4vDR6tSWLngWdcXHduqQ2fnwUm1sbV6KvEea
	L7GJWQ8Y+9HX7pKeHCyI8O61c1A4Z0E3Yu47zruncRqDAmorWSJ8ZhAEKS1IZpgTOajAbIPEWHf
	Vvw=
X-Received: by 2002:a05:6a00:2355:b0:89e:3742:3e16 with SMTP id d2e1a72fcca58-8a04ba36f4amr135378b3a.18.1792169157872;
        Fri, 16 Oct 2026 09:45:57 -0700 (PDT)
Received: from [192.168.50.20] (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a010b39a37sm648600b3a.4.2026.10.16.09.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/damon/reclaim: improve grammar and style
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Aveline Noir <jm5905938@gmail.com>, 
 Manuel Ebner <manuelebnerli@mailbox.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, damon@lists.linux.dev, 
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261016142921.126622-1-sj@kernel.org>
References: <20261016142921.126622-1-sj@kernel.org>
Date: Sat, 17 Oct 2026 00:45:43 +0800
Message-Id: <179216914308.58773.4774391289742300524.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792169146; l=369;
 i=jm5905938@gmail.com; h=from:subject:message-id;
 bh=yWna3LGyk7AO4Z3H58l7fcPnAfl+aPw+asBmvCYoCyI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgboJ0y2WZIrQV0H4HJI1WEQ5sxS6pM
 Nc/XEYGLW8ee6wAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLauXbEbo1Z6pn5MzDJimI+ZcqaQ2pweWmRLgCUWN9HvAatbqa+C2vTY/zHaGewbHARInlDH+zY
 6fx0IcRSlJws=
X-Developer-Key: i=jm5905938@gmail.com; a=openssh;
 fpr=SHA256:oSxqik6Pl1M8EjQW1QXKHoylm1jy0sguOWFFJlA9zf0

Hi SJ,

On Fri, 16 Oct 2026 07:29:21 -0700, SJ Park wrote:

> If both of you agree to my abovely suggested/agreed changes ('s/page out/ pages
> out those/' and 's/records/charges/'), I will update this patch in damon/next
> tree with those changes.

Both changes sound good to me. Keeping this patch focused makes sense.

Thx for taking a look :)

Aveline

