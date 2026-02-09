Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED8371051
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650475; cv=pass; b=fawskNHnAaJ5mwevnJPtPyEHzTyKKQ5+0dHv6CMQPnOgDDsal2DXDbrRexjiSVVd+6f0L6Gu89uOKVdhR4fH93dS7SZC1FVsP4IchWXxKuqp1/FMRrIoca8eorkAbujI2LY0zPyKkES7z6xJVMcagWQHNOblf3MAmNR76pD5b8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650475; c=relaxed/simple;
	bh=CzEgkhzt5xOodhN+SSSPDZf/L8KCSTMOudC0ptwCdYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g0LSwSQQLe6e16hS6Bxt8s9UC2z5iW59e1qyt8e3rEoJQuXfEjyR1mJkhUxK5MiPh6lh1G83B+DZUA8CKATs8yzCAqA5nhIVw13XbEEudUBkyKaPP3p1GiJHzTYZiGuXCyHYPQWaDZ6mtPU+N9RjKzpqx0aqTBPv3aYAp73I+mg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egCtHbfe; arc=pass smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egCtHbfe"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fada0925c8so791002137.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 07:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770650474; cv=none;
        d=google.com; s=arc-20240605;
        b=dUP6PKXkFcgsaVwUBO970xrHXklfJLYNGIn8KPFOrhzns0AXDfLDBszVi66/Popml7
         KWAznbKk7u5eGIAnRYDfV8tkLq6/oTSm0xjDfj3ac7J3iPaB7rTGi4w6a0wz7Jq8Ybdk
         IX4kmUO1WI+FW4FcBJu09hHPQvn1/v5p5zF0l5oQ2rd4ILchVLiwcOWouqFS/+wniEYX
         jf8ahLbZW0gVStW6ywANnQupoeRs8FLJ0eNbirDBr0kYgVmutRfCG9JyZMBxubGq0S0f
         wB4sb1rTCu96wa86rUsOXSc3D/e8ZodwX9KijhriH9gKGPeM629bRQFHFG7qCWyEYTgM
         l9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CzEgkhzt5xOodhN+SSSPDZf/L8KCSTMOudC0ptwCdYk=;
        fh=mB17x5rqGxmM+7qYlkkKHcyqHfKb71+xzxpMQjlDlVw=;
        b=bleQT/3lo2liHlBPiFwM/DZNKJCb3cMnKDQXCuZk2G0XBztSTRriO/HRGKnVmMbQnk
         0wJrZqMAT58ivPOWfQrC2tCfJhxjS7XKnhjCXCOp37u31/NcIG/rJJx3euhpDF4kNz+a
         /SqN+kKAHxqJyIhkJnO/TcBzS/wYbVr4fWoM4wvNzTJxh2P651+LBXHBz9y+ya/6SdfU
         c5nG3bNSFXrzJmqP8xVIQ+qnq1gigkoPpqFqxr3DolfaY2VBStbjh2NryoQzbADjUNp2
         CFYbxC/22GJDBlkkDOvfqPThHFFN2bR7VxCHx5fKCXblVLyfNiFRZC3Aj9cdvMuxrMvM
         C3RA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770650474; x=1771255274; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CzEgkhzt5xOodhN+SSSPDZf/L8KCSTMOudC0ptwCdYk=;
        b=egCtHbfeh+v/IwgtSVQPJoCY6Sd3vERcZd6ZFAioTxRgq9sbYW31LBv/eKhanpSpQK
         ugGjGAoMef1t2tCuK38MpkwNS/soDnoG1skVgL/f7SDkioEPqqf7nbY3UnuonNWk6mkp
         FtHz+CsXeYVNY6zyIGa65m8hEsCFwsrb7xx/UAHJNqeW3AtU/9Lr+NPKK4+/t3ABZWZP
         ojgGNt+2yavibIepp01tOt3d8Hv62l2eGS9BRMr48zThWVGbDsURbF3aRynz+wURl37G
         CeP3ywljl80zs11l92g6JKS8VtB84rtadSmnLtrGhEfepOOmms/Jl2E5KiEZCoT8Uxfa
         wE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650474; x=1771255274;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzEgkhzt5xOodhN+SSSPDZf/L8KCSTMOudC0ptwCdYk=;
        b=YvxkWOvAg9jgWk+2Og7NBv1KgLCal7geidshG5gs3rLUik8Hf16kykoyxYDCR2t+h4
         /rGMS5Hm6X+DyPfi3Pf/Mnmq0zOWBPRK62I7i2ZbJxexR6sKR8jKplD/QtuEx1FgppwF
         qBSjRIBvOes6uYmPvvlML/pxbkNZh0LLwme+XXLqQh7ezX6L7/ITYYU45gWKn+94UWXA
         wMXbi1W5/HFURezWMWCwIwop17ogBV8Yilkupb9nfTE9s1HrIR57JVd7DYtMU6lMcoaW
         9p2zTorxChfKipldWvqlf4DdL3kIJoiC8Zw5nPNB9Y5EDutP0rm8ozryQOzBSzhVtXXJ
         akaA==
X-Forwarded-Encrypted: i=1; AJvYcCWCihJIE8odPKFV9PnE9v7bcygmdu5B0Wyv73H5KzQuWHndEnpTIDSt0XrdeEQJ85RZo/ljwvYpxac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZKH8R2+yA8vIEX1KiN3FN8XPCO7ppH3s84CPRrAmu3uYMAWz
	Bb2HJ3mD16MvFYuBjjd8IThMbsspcDQ/OQuq5sYmJzV4rFILB7DS0U9r2VBx9+M588K10AioTT2
	t31DG9IR9G39HyxY/Ak3SSbEE2oQwoSI=
X-Gm-Gg: AZuq6aIFtCkJzq6I0WtTPEVfDlnFM/VAASUQ1IGBad4A968QUuOqSxVwxMqyTA+UmKr
	tnWTmoCqvR3kM24p9MJkKVY63T2TQvQQXg9Fg7hPb9p2SufLXduW7NIf2wGeSXPbgLvYksbvQDs
	5zN/H3tJKqk1OZwjVfaFVwmlPiLimZQFZQInymSa6La9NdYhbp/xUNeDTA8LtkhNoaKqh9AzUm9
	gVm9HCJsP7TdVeYRLzebmTZkNfe8qaHgI8G9gnhZgRZ6hYC5es+vyvWMnBy1ijWesPcCSrR
X-Received: by 2002:a05:6102:374f:b0:5f5:459f:9860 with SMTP id
 ada2fe7eead31-5fae8ba8026mr2979003137.28.1770650474093; Mon, 09 Feb 2026
 07:21:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209081323.68339-1-chmh0624@gmail.com> <87wm0m9dn1.fsf@trenco.lwn.net>
 <CABzB-hZpQOR5uxjUKGf2DcfcNXSwpaBf3mmKdmCU0T5=uDVz1g@mail.gmail.com>
In-Reply-To: <CABzB-hZpQOR5uxjUKGf2DcfcNXSwpaBf3mmKdmCU0T5=uDVz1g@mail.gmail.com>
From: =?UTF-8?B?5by16ZaU5Yub?= <chmh0624@gmail.com>
Date: Mon, 9 Feb 2026 23:21:02 +0800
X-Gm-Features: AZwV_QjQtB8CakyLgAcnNdduNhbYX3xfuqNQ2zE0V2aPgIsvvIiBlBwIebLBdgo
Message-ID: <CABzB-hab1V2oKCmnpYjY-FDXbVoMbJnXjXnnU8YqP-CypkXdng@mail.gmail.com>
Subject: Re: [PATCH] Docs/mm: fix typos and grammar in page_tables.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: akpm@linux-foundation.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the feedback, Jon! You're right, there's only one Linus. I
have just sent out a v2 with "Torvalds's" corrected.
