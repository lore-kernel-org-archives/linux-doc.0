Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A391D63CA
	for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732639114; cv=none; b=qUZBIHhjs2XQPv5sLznHFFFKmzxkeNFLF5bjsVYKJABzltAjPRLz+VVoLX3dQBx6ON+Ijd38qUZVqeVkHJOLvvwXbWGZ42Bot2gGoAnnDOK73+ul7hIfdvyUO0alKWZlKGpbTA7OIoFai/HbDGtgKXH0m2D++IGZYl2geY096N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732639114; c=relaxed/simple;
	bh=6vJi2VGs8+MLNHsBgobMIjMzwwtWnBRekU0CRZi1eUc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qy0OHprXFVHVrp2EOPrT7D80wYjezURMQebtADnq0Q2EHyUS6ATAHEmuh+TnaxHWL/BcTdJMqcYJwZZXR+20fFWytVEzfkQ3Q80+8Zhd7vo37D6WqrL2VpxxZMWUoLk7KiVI9nQkhEs6Fij9ASvGZV5bZFupC+DVA6o0bNcYcws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBctbsF0; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBctbsF0"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e38938a55e7so5291164276.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Nov 2024 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732639112; x=1733243912; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6vJi2VGs8+MLNHsBgobMIjMzwwtWnBRekU0CRZi1eUc=;
        b=jBctbsF0vfSbdVa/o9frjQHnEJDU/HMatu5/NixhagqWTFKsyb+VBLhLBYl/5HRuW8
         hSeujHZH6a9cYA8gOjg2bzb7lCkLDwYWhPpSrXXQmGynPkxH0Z40KYKUt4pZf7i3/LdC
         Q/5wLMNWeuXbhJUZ/2hGYH2AFqkSBJh6CiRWOIwtyCBeyd+bBN/CGl3vsazgbpY0ME5W
         /9dmo1NX5eWFb+C1tPSbMuXPokfPYq0uOOayGZeNk9pSWqGGAq4D2NI3FXV4mC6tBHsf
         HOB5qCCmmUqJrqQQOBS7CsO6wGTGH9fFeris1ibCKueKkpVu5kj03bqO+ZC6AAcUOAiX
         PzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732639112; x=1733243912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vJi2VGs8+MLNHsBgobMIjMzwwtWnBRekU0CRZi1eUc=;
        b=TBd7n5BHQGMa3dwQdC0RNsxb/pfP+NjCtsUCDFE3pbApm+Gxkl6zhF8FI8Nq27yqgJ
         HTBlJL8B3FHD2u0gVIMP9JqBbgTSAao8E5uKY5Cznte5pAAZwXtprLmQ5XqtSA+J9ChA
         fgotR3LGQ7zkLLO4LpAJP28VXTOi6jF6Cz9KJxwfSI3sgNxvlXwiXG8hiInDX02/P1Ly
         1F6vOmP5SU8JrEVqWciXuWipcEK03FbSpJPZSNI/Q9aXbqjWW98oOwH2rNfIfp0oXu82
         MkVoR+gdtWlV/yvlGxwnFPfGqlHKRi5X/Owi7nYt4HsOF69PhNISt0/p3XABBDd26V3Z
         Jdfg==
X-Gm-Message-State: AOJu0YzVB18zZbvV6XOV5XTRWa9romkbyQnSQ185JVdo/KmhsGb/gIho
	mIK869klFfIYZkfubY0eizStLDJG6Yx9QMywJwzfbU0D3c8tdj3SCR5kjUcytqqSvFM+Z4apphO
	aErZjqkRPzfdukZ76RTQXA/AbepnaDnsX6lE=
X-Gm-Gg: ASbGncvn2+JIfii4ZG8EkkTHI4qJXpwdPV2Kzu7rE/u+pB0emL4ZBEYE/XJrT1fsOgS
	u/rGQxwWQCn9cCAUCdcXZiPMv5/8=
X-Google-Smtp-Source: AGHT+IF+gSRbeeGUBWZQ7Y4zlCPWgAPUcHtfuFbA64hLbKzY54vdWAYBNXl112e6E+jvIsRRYOQBhW4Jh90127pNaog=
X-Received: by 2002:a05:6902:2085:b0:e33:1c9e:5cf2 with SMTP id
 3f1490d57ef6-e38f8bd3578mr14993240276.39.1732639111915; Tue, 26 Nov 2024
 08:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002094940.55644-1-simeddon@gmail.com> <7989c006-abc6-446c-8b2c-dcb9acb9732f@canonical.com>
In-Reply-To: <7989c006-abc6-446c-8b2c-dcb9acb9732f@canonical.com>
From: Sid <simeddon@gmail.com>
Date: Tue, 26 Nov 2024 22:07:56 +0530
Message-ID: <CAGd6pzPso9kQRoS=4rVj2c3=4kxLWk5DJ3VfzH2cAxXz_y2SmQ@mail.gmail.com>
Subject: Re: [PATCH V2 RESEND] Docs: Update LSM/apparmor.rst
To: John Johansen <john.johansen@canonical.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, shuah@kernel.org, 
	apparmor@lists.ubuntu.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 10 Nov 2024 at 02:06, John Johansen <john.johansen@canonical.com> wrote:
> I have pulled this into my tree
Thanks for accepting my patch

Regards,
Siddharth Menon
