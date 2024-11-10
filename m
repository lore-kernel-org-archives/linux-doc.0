Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB01E29CA
	for <linux-doc@vger.kernel.org>; Sun, 10 Nov 2024 01:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731203782; cv=none; b=nJ/2wlhlThpUTujNGu89UqD4j0rn09bOS031bFuB3HL8TXU8S5ChuUzHfHnVUP9eBXZGmbnI4Ndjf8E1yYyqpjyJnPkiGje2Khx2RGFTJ6B0NUs6Qmo+lldCtRoDtr10sWRV7b0WEHbzUm+cRl5zBngJhg+WY5EjIGw1sHGNUfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731203782; c=relaxed/simple;
	bh=RNpg8eSo17yZ5Wech0cXwFwdq428G9lz2Qvyu9/dm0E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MTgQlWVQYATCtnOLNPDW7i6TYxJazsh6voXqN9rb9BymAS9Fa/GHPn7dCVE9bTAIGuJvevujS3B0gXEDQ94sVyfdY1OAOtcC3ntI0S1xLXP1lH9uyKzLmQ5yNABlPtpiqdTchsUP1dK72wZ9GzzJC16rSKjyFDuzc1pTw39Xm40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf2MqiUE; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf2MqiUE"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2887326be3dso1623900fac.1
        for <linux-doc@vger.kernel.org>; Sat, 09 Nov 2024 17:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731203780; x=1731808580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HeCl0NvAUckEXeLzPbYzwQzWScyuc7or9ME67yqiP8=;
        b=jf2MqiUEPWbEMBs473zl5YKH8EbTJ/5PiEgJweK/pe/ajg1fA6SlLu45XcPiaAKvHe
         6AsxgLS+R+shmiW5nly/H7HpOmkz7dUTC8Rg3PvAE0pOB+lWHIOSGHW/p/2qxpNombPF
         ddTRrqKUBcJmpDF/ZKEVPOw0IBWxOLK2emEPD+i4ldQgcG5f44+LAqezYGvLc/5KVttG
         dWzG1i5rztFJwatcs2GX4a5fzFaR0M1zQ2H6gH6I4Z6cfDFK/BS5qOVDCxKeYKDGrtCJ
         sEr8cDBuiJjhdLp9c9o6Qfc7aoxRoP7kglB0121oKe2K6DnoQBf7eYfsh2C2MfbpA7Si
         N+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731203780; x=1731808580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HeCl0NvAUckEXeLzPbYzwQzWScyuc7or9ME67yqiP8=;
        b=FGiy+otFLjNp6ClulEjWbeLVAz2gMDwfbZl0cx1qR6GcxVbzoY26EDL7kSeoxaDqc5
         yi1R7nKfBo5Mf6VLRgm6LqSE5VueKbA5ChTjY34itgMcW+RVgLP6+PxPZ5RIYpkHaq+5
         mJtHDXrxZl+/ZCb53nwNHSMK7Qoz3mpC/gNcqHbULbsVbho6J/U8pTCQQa0/WIVX56gQ
         mJlh58MTHr7z4ZE5XyEhB1EkXg6k9ODeDbp5jObugu78PogXwDzJR2Pg8Oct4rORYp6A
         51UTyqUddNQClpqmg6zpv5xMfvmn05QJYnFoyu9FvSRNZf4tUIJKgrWj9oDYcRMB1bEj
         ofWw==
X-Forwarded-Encrypted: i=1; AJvYcCVDWD7CWQvZUar6y8YpHCSY43yVE4mz7QjfMsGpqVu4Q56GIVZkBcjEgZ5d/iIRcV2wraQHVzUOy14=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRx8AxpEbAnnyztOVZHNgJ65sFNiqHINsJiDG86VXiyjQ5Nsbd
	jZ2rV7565n7AOZ+m5k0lRkUkDbNs2ZrdgYdnJR4sAGURTkaGdZ0eEoaO83+u0VQsWXr17N85EWw
	LZKExBHwj+6gGjzTekcd1LkBEHMM=
X-Google-Smtp-Source: AGHT+IEW+qOkOkRPPlAD9xl2+JFa8vTtZPpIdXwusxGKZMSfXrRc3jgfGA78AqPJHXbWIAkcm7nQePSPtet4nDWwWQU=
X-Received: by 2002:a05:6871:10c:b0:267:df02:f7c0 with SMTP id
 586e51a60fabf-29560281175mr6924188fac.33.1731203779906; Sat, 09 Nov 2024
 17:56:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Sun, 10 Nov 2024 09:55:54 +0800
Message-ID: <CAD-N9QX7B_io6wnx47w_CJpBF4vFOSS5wskr591BP1xPtz4cYQ@mail.gmail.com>
Subject: lwn.git does exist or changes access rights?
To: Jonathan Corbet <corbet@lwn.net>, YanTeng Si <si.yanteng@linux.dev>, Alex Shi <alexs@kernel.org>
Cc: HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Our mirror site (https://mirrors.hust.edu.cn) reported the following error:

Mirror=EF=BC=9Alwn.git
Upstrea=EF=BC=9Agit://git.lwn.net/linux.git
Return=EF=BC=9Afailure

Please make sure you have the correct access rights and the repository exis=
ts.
git update failed with rc=3D1 fatal: Could not read from remote repository.
Please make sure you have the correct access rights and the repository exis=
ts.
Total size is 2.8G
=3D=3D=3D=3D SYNC git://git.lwn.net/linux.git DONE =3D=3D=3D=3D

Jon, please help check if lwn.git has any problems.

--
My best regards to you.

     No System Is Safe!
     Dongliang Mu
