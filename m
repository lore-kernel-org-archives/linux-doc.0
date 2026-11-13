Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559050;
	b=CkqcvgiZdPjGFxtHUqVB+MxcvLe+KOtCa60icibmxG5mYj/Q53n8HzATXjZ+r9sspZ4Q
	 NYLtjdSSsAFRrX/GqDE0qDACcA2KRVU2iiLeZ7nXENIGMn2vMmdS/5/VD/quMLocj+uF7
	 uuWVaakVQp2e6VKtnDyJ2/Zpz4mhbV63LpMYSC2A/vdH7ewH0RnWW3FEmmxjiHkQDvtXI
	 81lvdH2umcsce/gL+OzrfX/njfxLpjn9PiTlaTI4mwv4dKDEg8PjuHgNhcN7G7KGUICNw
	 NeH7d2fd5fj6SIQz7BfAbDC5hUBZNXa3csU2C9ix/6l2whBvYwE2nmPm1IsWaK5+IIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
	b=C+yvzE6bwMvSKZg0svV8LcyTj2Q8wHwcweHc+xg8ZhOzmvHlKR8COCPccFgxDxfWCz+N
	 x9DfAovpF8+QRdSQE4WCqcgvWHB5bj8xm/Pj2SqDQgmQ4J4P5zkjj9UASZnrQXAx8HNMA
	 A+wForjwjp+TDIMIiVgPcFY0KSy4u15TsoS20uqLkPgfkb0bGMIOFXB0T5hdqC0DrOrfX
	 5bV6hFnUEkzWTKiTgyiw5i5Ix4x8SESIug4lOBHEoTgRNwO/IzFuaXIfzT61A8Cxnetg+
	 mRMI7HoP7sNu/vMXivaKHsbnMPiwJLN8jO+FcZ+LKUvaLG3Ln81zaEPFMOZNbQNH2lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E7C606B1E5
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E7C606B1E5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=aD32PBvu
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so286325a12.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559049; x=1795163849; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=aD32PBvu9kNTQaV89p9UhhluQuDwjsxlOpcz0WYynBd7c2sZ8ptEabdXMyKoV5ZWs4
         W5QpazPGqxBK43Muc0B7nDBDrnl/Bg3eJ0yyGZxgubUBEw6Xxguc7FsXpeg+SB5iigkR
         6FbOU7bGojIdNULaDsdddlkd5MmBq63kSuhHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559049; x=1795163849;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C0F5qYv7gtQEkIA9c8+UTK9jR4byuBtt4GhvmbtO5Uk=;
        b=QoYykEtZzLJwpjNDmna5ISUC6QRxgCAfXoIHZ7xzCVSCNnHUZbX1AtEEjh80oqfINX
         TvPD/T7E0nZ+SzBxpHpeQfms4I8Z2STZurhILR5E1JTjIZIQOTzY6BkQWeFqciPY3y0o
         kWOeXChA0x9yKEqf76pJD1a9hBwb6azU1Ta3lR8pZg3Zh0Xbbx5Kwl24AKlt0g4YFoti
         cMyZeXx/zzdWXe/0MKRCChWfHe+GZSaazCAk8rlayXIS4WX83ddRgoA7kik9YwUWx5+d
         rZyU9yIsb9932Ejul+zXiGoYyfLnBxm6Un5ATsIevnXprLxqRejArdWJ+h4dfzG+xp88
         H33g==
X-Forwarded-Encrypted: i=1; AL+hErHjSWsYA8ZMEHet9c5xgli0bigyp9cjmJ9XZaxViyz7fl78LiGNlIomTOS8BruiNp48HcGGg8AydsU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ASfebMfhh7NaJBtOYpW+Byonx6F5EPJ0HPta/Vv7Ux5xXLwAp
	/2O6H+2ALrcJdcCCXgdW+Y+9P/HyQ5/TPKZNHv1fdttEMqy4EG8C2iseCST99aPP3ss=
X-Gm-Gg: AYBFou2pevKQbPUql+fEpeQLdstBY2+gzg/tMkhN0tabAAWnyZiiSgOT6ixj9qypL+s
	3j1n6NtgToYfKYmr2HE+sL3OjOzw+XKcIjM2A8uly3PtJpXpmFv8K2t/xIiHbNsvWZMpCX5eYIB
	Ed2YOkAhJyAxYcVzITcz5lDbAz+UuhLWT+Pra8QeAfxDXBQKiKXJNsG6Ayw9hhZDyoDWvvF7zDI
	LmchgdIaIsjrrs4AyjvSOLLRfDl5D3KGn/KIMrWbheF4+cjyvkH2QkCpyPPium8vP9oFysF5scd
	lKTWBc7zmP5wj6hqkXg270XTig7+jLnpZku3X2QhvLFMQHbL+7u+xaHf15JngiqdW+g62rGBzw2
	biE6pbyPXU85iNubpKGKL98hVyacQtAfez3c2qB1fGMCNaxgdCENDTGqQn/20Yaab5bkmAT+YYI
	3DCXazwF+Azvr6gRNOhHNM38yZ3pgfDMjS2HgI3zEwWVK4HHPr+lbwb2inAI1dStVs8BECIF4Wv
	68Uen5VWCmpTK1KMS20PCmoGGZWCCvV+sDR4rSebesPB0z6SmBsJBPRbbZrTYGtNq8+4bIfv/Uv
	9fFYSxdcBuqjtZw1lkJkgyJb1PFNR4snDzziUHlGFfp7W0IZLr4uqhBLBtDmMvQXx5F0W0Gp76n
	pqS9ATqoqX6z/NwAiTa1+POmkiNhI/q9aUc4TE00+3A/kEEYsfo+vvq7l0yMF98I62L9Emearhw
	Kg1ZW4ICdhkHCQiHJNxeLBmpO2pJHsidQm8yyWWLAMyzUsw/id369YI0U48gIfnUTmWjvqMbGIT
	4dum1gB
X-Received: by 2002:a17:90b:4c0e:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3b1b07ef0bemr1782230a91.8.1794559049401;
        Fri, 13 Nov 2026 00:37:29 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb17042sm3384750a91.6.2026.11.13.00.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:28 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:26 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is disabled
In-Reply-To: <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name> <20261027100843.GA2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003726.68aef052ac869097@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>How about you push that scs_is_enabled() into task_scs_end_corrupted(),
>this makes less noise here, and also keeps the next patch saner, no?

Yep, that's nicer. I've done that for v2.

Thanks!

Chris
