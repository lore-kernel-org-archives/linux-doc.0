Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674883BB36
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705928116; cv=none; b=dSAB+hJ+2duOu7KrUiqeLnqMJiEjp/Xtv/CNLyP6djcHjCnx7G4DwkEtHPGYw/IcGNhbssuvVeA9bJU5THwkHiszUNpODGgpIDScbtEJkI34F+XvtC2XKvFlQOHGMQ39sigAI703YTzc3B/VGq00OHBx/GDgz20Xi5PCddszoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705928116; c=relaxed/simple;
	bh=v+L7PVTpZDw0rKx6LNXPOAvhzXFGb5VQm0BCqFUAkRQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R16pkjFffedPcUxsZgRWMX6NnKHRTKDAr36Oikp2RoTwhhD06mZZeEng/bHsAhjR00stuEs81UNpLRmru8XzkZAA1tp5k4ZAhtGVkyP63doHTFPVrNyhfpxqoqtVSqC/HbOVXg3q0pqrSrz8heLIE2xKqdaUQrOSiepHmDkn2jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SQl/V1bc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SQl/V1bc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a2e0be86878so760737166b.1
        for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705928112; x=1706532912; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IuUKVWtvvYIXVeVdCt3DqjuZg1hGyra7osExMMOSS2E=;
        b=SQl/V1bcIuhJ5oVnf9KbTKasKw/Xc9CFzbh4SxN5CjzJDNDyaaY7llm9PPRgzR6u9F
         OHV9I+5WhAMPolI5Ks8oBWlKTDa8gjb7M9JjQ2GD5/j8+Q02z0QUpLTae3EtL0rR60Ni
         uRxndjWKzk+5iv8yzMlciuJ7hLrbKp3P8Mn2Eif7I1Dok5xbHJ4YDIywdyWj87n1TKJb
         EqiGacj03JUOdgJlBgTbfxnH2qNueapOZqAM1eEL60M8r250R94FwiwsdvrTqr9XPJiI
         pHTO8Nz8MvAl2F+2jxO4C2VJW0A7tQ/Hm/2hZOoXgkmrkw0Uu8xpRCbbT+uVHSKx7xyq
         szVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705928112; x=1706532912;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IuUKVWtvvYIXVeVdCt3DqjuZg1hGyra7osExMMOSS2E=;
        b=XiiREolkjyBDffw1hNA3sUj91kVXdHGm5QvS21yLNIWaJor40apNM7FFhFTkBxUn7T
         E+g0VxVUIYOrIU/LztHClJQa98QK9HmFtPHKC8z4Fcizs4La0M8ChceknD9SuyrsV9Jw
         AQ7aDtgnzKkezCUqS+xPMenTvARC5XUYhqTQFFe6RySBKjZz7xcrqqmUNAC/bvYy1QPP
         FtFtvLcOc+t3lDafDyNW2zRLAgBSgrXLoK6/lqelB3tL07/HqR2GQM+78bC99akBrAq7
         GCt3HoC1T1n/vcza5sd0ijhVlr8a0wblUb1HsJHQNWMvuWrX44+HddG3FNWjP69trEZX
         RXwg==
X-Gm-Message-State: AOJu0YwR9ERjx9o1UrmyoDte4uEZ36ez+2A2/cZlgUzb0NnLkRhNnUxC
	4FCFYYuZU2DCaLcIPPRufJ8gNHdFLY5FfZLiweiUjfQ+RC2z0XQwYfjmbcVjkPE=
X-Google-Smtp-Source: AGHT+IFMwp2rvA2TkeKR8EEYT9ihnqdp0q0BkNQSHFUaT5nh8UK+VHg2raGKecMA0Ym1+fdVY83xQA==
X-Received: by 2002:a17:907:778c:b0:a2f:6053:2ab7 with SMTP id ky12-20020a170907778c00b00a2f60532ab7mr5368477ejc.11.1705928112494;
        Mon, 22 Jan 2024 04:55:12 -0800 (PST)
Received: from ?IPv6:2804:30c:974:ac00:1b02:e2fd:23be:79bc? ([2804:30c:974:ac00:1b02:e2fd:23be:79bc])
        by smtp.gmail.com with ESMTPSA id g10-20020a92cdaa000000b00361b87d1645sm1526721ild.54.2024.01.22.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 04:55:12 -0800 (PST)
Message-ID: <53cf93b2efadc0f42712eb92436bd575b5622664.camel@suse.com>
Subject: Re: [PATCH v6 2/3] livepatch: Move tests from lib/livepatch to
 selftests/livepatch
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina
 <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,  Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 linux-kselftest@vger.kernel.org,  linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-s390@vger.kernel.org,
 live-patching@vger.kernel.org
Date: Mon, 22 Jan 2024 09:55:06 -0300
In-Reply-To: <Zap26MINbbxREt4c@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20240112-send-lp-kselftests-v6-0-79f3e9a46717@suse.com>
	 <20240112-send-lp-kselftests-v6-2-79f3e9a46717@suse.com>
	 <Zap04ddls7ZvbL/U@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
	 <Zap26MINbbxREt4c@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-01-19 at 14:19 +0100, Alexander Gordeev wrote:
> On Fri, Jan 19, 2024 at 02:11:01PM +0100, Alexander Gordeev wrote:
> > FWIW, for s390 part:
> >=20
> > Alexander Gordeev <agordeev@linux.ibm.com>
>=20
> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>

Thanks Alexandre and Joe for testing and supporting the change.

Shuah, now that the issue found by that Joe was fixed, do you think the
change is ready to be merged? The patches were reviewed by three
different people already, and I don't know what else can be missing at
this point.

Thanks,
  Marcos


