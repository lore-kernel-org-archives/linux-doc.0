Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1673B8D68
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820760; cv=none; b=QkhKL81tcnKN/thE/E40Isa+vb0Br9qvU7dC04N4ac6S4Ow+r8dtt4NyIb4jeD0E7OO/brrUGa+/t+IDMFC32o4K3s8Ybc0OxO9+QStB/j9RPhyNSSqJoX1JbcEVJy2vnV+t25HZBoV5QJtVIxbdyMhDtrq06qIysUgL7t85W14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820760; c=relaxed/simple;
	bh=aYrTt9D8MKq+zjjyW0pVCKBpgOeDzFVAhdtV7GIBWxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BASrpxN/R83ArpHf7mWxrk/xm3/xzHPh2nwuaVwX/QQK6Mh4JsXQTXspHXA3ahTFcKnF4azlH/U4IqZLcgpmy2B1JKnQ/6vcXuyfIt36NNbxiHqXXzYEdRHOGQBqyyCnkvg/5HH5bUBS6hAwio8Ejbf3baqA+zVHm2oZnF7pqJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbVecw4j; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbVecw4j"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c3259da34so2321316a91.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765820758; x=1766425558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8gAlOJLXsZJ6S8BYRXwAkXE7FMVUf7e3keU7azU8fg=;
        b=nbVecw4jf7m2ycZSAB48mj+E1aNwnwnkyWemYVGI5adJ3pW+xRh5nlFTadKLKLF5CD
         JUbi0027akMnnBIuAmb0KH5gIRqcKTa4kSSU50FN+knL4X8iEiRS8EqdzjN4mI+7KsoG
         0S6TyBAAdQqY0BuukbVgX/5MLrt2rkRJbwqhzAm7lpSrCDlpUTbS1diYp0WtUjCMz9sR
         uouKg71q21g70VsXqVtxDKX3/CLrEwPlO/WJnD+FSBzPa1dqRqrvSihjY8S8YOWdONG+
         IXz4b1VdqrZNlILxYenesdk60QnlDTEgqnAy8PVYicff272tSZCtEt0QD+YpLDRqlLzk
         XI/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820758; x=1766425558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8gAlOJLXsZJ6S8BYRXwAkXE7FMVUf7e3keU7azU8fg=;
        b=sCt0ePS4ueGwC4d9WDgVRSZnKK/lASUbLzkxqdlw8BGsT1CWFjJwCUEI45O6h4zOCy
         +ilYZweA4ApMRSWcpkigt8nj+qI43vx/vcZRsHlGNtKsVTFitDi20Egve9vDa6YxufCI
         NPH9irGxcSlcRgsN2Kn0T6juxi4W17Fqg8IU687nWngfYBJWfMryHvZulVTSds6mOb5c
         7dcnXwK8Mgw4xFq115gnHCuYIQjq0AKpNApaIQdv/C9fjof2faCjKaHTF/LhXBvcmp7f
         6mTvrD32Q50zxtZqLPjtOKohka03PmVi9qQTDb9qa7LFUtW8K7BlNkUK89Kb1Puhn5tq
         SvYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfIiEl0WiTYk/lHTmENmgalD6d3H9PnD6x9fnN7T2JCvwpwQA/46g7soCCQpaKeXZ325mYqYmnDRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0hnc0a2ChzWJS1r7ZFCJ+LA8GriuOY/3dzh7M1Ev1PeDlvnNq
	yk8c7dSeyl0VjbsqbYqz97PsXYv0leN8p0HEnqThEmt3BhGdldfIE0bz
X-Gm-Gg: AY/fxX7XbxMIW9ZXziJL2bq47pjX/aKnO3QKrRMRBuAaG1Z9pqpBvLrzfRR3ZJ3poCg
	SBy7nGm4iZznjvIRsXagTOnKkaWhtx7bh/ZR4PFKfKGvm/I0Ll1xFbx2Boy5qGHTdkPE37eSEmn
	vSFNnXdWF8N0EYYBk2+eAhUnP230zvlmtXAponjY9LIXnc673GGnl4gkQwLj8OVFDrMysH0/F+j
	iRzdNlEbPsCqV7WNkrHgJKEK9ZOKLKAkrU6KNSFtoOLp87n8wdC23R5s9TeI1UpVX0nOIzNq8dM
	Tut6qIkGdSHnphCVuheyv1Hp+FlSinWmHk4ughv7AuhXfcjyGNwNGRYdNhvaGbieSPyfLYb21GO
	51mqwKnQQlGVPLlbX466BGdAEeOfQmHt2VvyWeIX61v41En5BBapNH278wwKpXS8zKkyTyr4t7f
	hugvgpxa8/Klw7hJ0DcM8PMetEClFfIS0dt7Kb/fsKF27vH/4TM5I6kdFtN4gCDyK2cttOMscna
	cfTc5s=
X-Google-Smtp-Source: AGHT+IFmt3L3m0vzaclxKT/EjpoHTKVzh/8Nr2SELf/F1FfzF8lXdwvt3LIRhMP3R/xg30Kdhr/n1g==
X-Received: by 2002:a17:90b:3949:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-34abe478148mr9761921a91.21.1765820757864;
        Mon, 15 Dec 2025 09:45:57 -0800 (PST)
Received: from kailas.hsd1.or.comcast.net ([2601:1c2:982:6040:274f:618c:1657:f235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34abe200077sm9623156a91.3.2025.12.15.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:45:57 -0800 (PST)
From: Ryan Foster <foster.ryan.r@gmail.com>
To: bboscaccy@linux.microsoft.com
Cc: James.Bottomley@HansenPartnership.com,
	akpm@linux-foundation.org,
	bpf@vger.kernel.org,
	corbet@lwn.net,
	dhowells@redhat.com,
	gnoack@google.com,
	jmorris@namei.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux@treblig.org,
	mic@digikod.net,
	paul@paul-moore.com,
	serge@hallyn.com,
	Ryan <foster.ryan.r@gmail.com>
Subject: Re: [RFC 00/11] Reintroduce Hornet LSM
Date: Mon, 15 Dec 2025 09:45:50 -0800
Message-ID: <20251215174550.19519-1-foster.ryan.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251211021257.1208712-1-bboscaccy@linux.microsoft.com>
References: <20251211021257.1208712-1-bboscaccy@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ryan <foster.ryan.r@gmail.com>

Hi all,

I want to confirm I understand the current semantics, and specific issues this series is addressing.  

In the signed BPF two step flow, the LSM makes decisions using what is known at the time of run hooks.  At load time, the only clear fact is "the loader is signed".  However, if we really want integrity for "the final program that will execute after relocation, and any inputs as part of the contract, matches what was signed".  The fact exists after loader runs, so the kernel could end up allowing and auditing based on the signed loader, even though it cannot yet truthfully say the runnable payload has been verified.

If this is the right understanding, perhaps we could consider a design that moves enforcement to the moment the program becomes effective. E.g.  Load can create a program object, but it is inert by default.  The kernel should only allow attach or link creation if the kernel has already recorded a verified record of the final relocated instruction stream plus referenced state for inputs, is included in the "integrity contract".  

If the referenced state is mutable, then either state must be frozen before the contract is verified, or any mutation must invalidate verified and force re-verification and a new policy decision. Otherwise the state is susceptible to TOCTOU issues.

Is this the semantic goal Hornet is aiming for, and is attach or link creation the intended enforcement point for the "cannot become effective until verified" rule, instead of trying to make a load time hook represent final payload verification? 

Thanks,
Ryan
