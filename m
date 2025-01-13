Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3351E240230
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 15:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736782986; cv=none; b=dN+8bsoIUS5ILyBCVPcxw362w1JVBEWJF/Kdy7zpWDn3dsucFBH/ka/Zs0G5t6nQb2glAhZpeTi1zvXtLo3EatWNdfpW7el9aLeJoeaJ1t5WKFEljKUqBlRq7hvVfB8w2jfu39xjRQrm3YlT1q7ZMf4wzipo7rxuXltHatJTdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736782986; c=relaxed/simple;
	bh=CcGbH1FcjxfE/wTGd3ew2bSrIQuTnree9Yj9VGRdgBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufwWRF35ew06mju/IigoDKT3mZTjvlg5sAvvkTYaIb2MruMIWybrS8tAxNKn/sxWZeVzboFGpXzH03dsGO1g0kznq44lR5ZEi4ik6zP8UjfZYX/IjV4DYU56MqTzsd2+IPT8xPGiCkalWWUF+agDyFp5AYs9acm48VeCPNk4wMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PepcP7Wl; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PepcP7Wl"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467abce2ef9so459011cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 07:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736782984; x=1737387784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CcGbH1FcjxfE/wTGd3ew2bSrIQuTnree9Yj9VGRdgBs=;
        b=PepcP7WliB0lKmOxTpAZDir8G9i7sVbNY/oRRfAOIVoQ1n+CLCV/1UUvEE03HOxaCN
         2R5zHhnTyCXwk4wbQ6REgiP10x2U/HqigFAABlUAEx8vfZUIahrI4Pa9254l1jFQlULT
         icVod0y5RaVzfDL4vbY0vCWhnaOk20bc7+AUKojL02cwGsUBsDqQmceBWCR4SljAOmgL
         htbA6Dfv3cHGBoRkM+wOlZGvyDMOOK/1o/r6koV2qVw1reI7xT9WLP14P+2QUkpgB+Jn
         S3Bp2EEfUZ6lGGHcPa0sVHxDPZy0Sl8hN8FRk86B1gRfTXjE8bG0W9AIsTVEw8Tl64q7
         vFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736782984; x=1737387784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcGbH1FcjxfE/wTGd3ew2bSrIQuTnree9Yj9VGRdgBs=;
        b=NIndct+uiAfrW7rxwb3fRAx8xVbpE0wkEiVSATmyreSwY6N4SOzoNJGKAZNwAJTZ3V
         2AUONjpPjelIA57o38EkCxs0hehwf9IYm8BR1+ClJRzsEUETqxPxQZlc1lLtiFnlwcxT
         FNCQeHtpCfpx3hgQXrtq9oDjjcl+XXnpmmo3NT6NhZMq3/1HEKKfkILfRUy99B9M6AMq
         XPWRj5HWa7eKKE1scQUE8GgftnF0f6E8SxRQui/nBeLc0sicOtp4rSgPzHbrPjqX7i7C
         glK3SLJ0oV/ZuW02mLBK5f8qX2Xj2qnOrGcH9Oluq/5cVKFrvxm+rFIP9HNlic3TRPOB
         ZuJw==
X-Gm-Message-State: AOJu0YwxtmFy86w8y6oH5hjkc2CHJxnqfX2jjx4UktQ+fWRMhrrjkVMc
	fsZGiEICP80l5unwRTWYYEQeuIiZYNQgSeEj0aOwoNTuvUy61w2d3zMmgxnNx+p4l9WJvD5ObX0
	nmfqduOQx3KXqnln3HezdgOrRbfx0YTtIQgD7
X-Gm-Gg: ASbGncsQ9LzlPVnEYTdmlL5XGiIf9HwqmvO9O+oCFILl4ReCch5MjY+adWE4yEVJcco
	sgqH9PJtEWZ4Di77zH74PE2fQ30XENiSA7hI172/4yC0eQYxidL4eqNZhNWUMGOvXHg3N
X-Google-Smtp-Source: AGHT+IGk/2f9iKqPS5JWy56+w7nhcQ9w19yN1dLUMw4CrPiXN3LAfp3b2VMK/8D92xY7dY8c5FWAk6i8+zd+O6PJeV4=
X-Received: by 2002:a05:622a:15d2:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-46c89dad661mr11861551cf.13.1736782983896; Mon, 13 Jan 2025
 07:43:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
In-Reply-To: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 13 Jan 2025 16:42:52 +0100
X-Gm-Features: AbW1kvYvgpyLRvlhQSSHWG2TYelhu0RB9yPUb76dwvP4l89hzgfYKaW85dzxRjk
Message-ID: <CA+i-1C2dB94t7nDEd-41MgLeHMYGN2oQJyQE8qnkcx+xYdHfpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] x86/cpu: Add facility to force-enable CPU caps and bugs
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi folks, happy new year. I hope this ping isn't too aggressive given
the season - please let me know if it is.

Any new thoughts on this?
