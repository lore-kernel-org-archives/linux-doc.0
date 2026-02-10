Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A86B33CEB7
	for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 08:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770711771; cv=pass; b=VL8tJ+R3lWkFSMKyqBmaMszxag7heJbiRIMoNN22JOH8i0YW1Oje3Lvse1vvaGeln6nmuP3kiC3ru46laIOI1UdMer1yUBRfKSG1uSLDQ3l32fYbp9SKstkG0LVMMdbnOgzyLyI9nP0Tt7LdUO9RgCMTJwo3P6cr0fqxuyZmDl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770711771; c=relaxed/simple;
	bh=F+AYKdYj2aQz6nJ8e+WKOgPI6YaSnBpesxFCe70pCfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OarB6nbPgQeEStu/cVOH958JQE5G9uCofrEmpFSZgtWcv0lNzHU/gP3km6peWeQwnEymNq9JvFgN+iF18VMN2+auAgbTpGpoYjfspyoopR041M1S7a2NNlV29fi7BCir+V11ui+UJDG+qHT/AwegOYI9gzXEjLzABBxgLFO7toI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyHvt9lc; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyHvt9lc"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b867142b07so156887eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Feb 2026 00:22:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770711770; cv=none;
        d=google.com; s=arc-20240605;
        b=Ix0HT2MpIkS24V+3C4W9pIHQOfPTZtJ523OcIr16ZGzkRoopySDhPXcxpDZbvDKu94
         IxBkqnlMFop9P9pxzQpJBSRpbIwF51cqSWYDxhkWfLvZoPy8SRT7W7KXreGBcc/P1Gvx
         nh5oPryLfH+QHMUXQ7uMpxPu1sJxEZN8E3arUXNuJMLfAHabVzW7mHcljR3fl4HnnVfV
         TyMmIQYZBFwTYxMuAAqI0q1X+Rwv6q8t8RMz2RiXyqjqplNP63vVvAgM7/Xpq4jhh/hb
         iDV/AO0YcbpiAdN84peFhWCwVNda5ASoKbs8RIaswdlKbfPYzNQcZba5rH0XJKWCGRXQ
         DNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        fh=m45xxA0Ek1nDjetQW1agmp0z9OzDV7G6weIh1Ua4+2w=;
        b=S0nq7/gHwP495E8tsc3JT8YGPW6TMuN25UGJXrVJXZNh8gLVI6cwGWyvEnQ0P0DVYT
         FFeff/rJGSNffuW63hSA3zsU69wouRJ+ttg0YtKCYC9Iz5W6fe3lmTLQZcnRZ/eTjXFN
         Pz91cA6JEaKhpLaFLI3JpOBaJQP+NsDY8flQ0jCUz54a0NDJek6CvFZ/KhXZOXh1Wc6K
         c3dUPjQKvR/8tk4EeyBHGKd4TMCDuRn7CkHzWtuU59dd5U+fJlQgp/rRpDhafKVoksZ9
         oBEEqF9Gt//LMP94a6GZQY3hzquV7cKhuzMEeT5dEcQdJwpoDAWGpucPJLYabo1i31pI
         C7hA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770711770; x=1771316570; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=CyHvt9lcZdhkePq81jZfs3kQID5qH1fXl6W53uxESQy/JWy7NUlqIGzDLoTsh5so6P
         IbaYEBuOXw2jgkzWjacnMxzVm2aKDAzyWMc59Wii4/83cNYmJLbz+yK2xHoHfjiNI8U+
         Jbihtul1GXSEJgGeykaVBh9GgMnFRIBMUvO1jHFdMQS5HhLv0msJUO8qOKaGwqiiQM3I
         dYlpXlvlGQgaZbwDZ/j9ILTk5zWyxIKdTumeZ1MhtJOR5a01V9FbPMmZidV4LgO18R8n
         eEOyOy1k1agumSYnsN/Ys9ltD2jdmTqedVSWpvyMRG7rwYW+zuf2zrGG2+y1ZKu5eTL8
         6IHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770711770; x=1771316570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=shjJtnASrnoyuISaERAPsmt/LqCJ0MRRnyZEjLgNklY=;
        b=dgSSsH6OhSVbB3tUduiTKO8IsAtOChgoBsrUHIrEHupFLbPuL6CrVrvYc29DOiKKdK
         oSXSiqKrLdZLl/legrRKz628wonDk3BbWcK8q9xRyutfyH/2AaqKLzkHD2R5PavECf5Q
         sMxM6F2jpsXu8vyXWmgY7orOA67NHW71Nwp2J8hbQG/ZWaIyViGjLtSm7DLUeOCwispM
         Z9H5IW9FrMnXW/Hvmo3EojaekGLrW1ttGLITKnncNZWOJ76Pdzu4aaiJks43rOGpyEi1
         +eQa1PvxhU4iZwFHkkyiIX9sUFaYHBORtKQq6IiHr5ghaL/qZdH4ZkHMg9mZO+tNJoJD
         0Qbg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Q8swgXrXLb9IyQgeM4TL6bD8HF1zlweIK7IbEja+CIDkEfCUE4qBPHDbZVNjL/43Yi6PyPTdhC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfh656zju5VN+WVZKZ6Mf+DhVq9RG6X4eZ0r+2L6FpTDvmZpzc
	/lM+3tWp9URuaaw519pOv3vLc48MvpOndPtyPb6YOT8+K5Gm6zkcs2lNoU0EfPVUHqhLuAMzef6
	VTQIkqaUsvQnw3NIT8hHmDP2vLZsJIP4=
X-Gm-Gg: AZuq6aLj9gwqDKF0/UGmPpgIrfDomDi/ENKUbIc/oXNp7Z0HIn3ZLEaBAg/ZC9+/Qpw
	UgPjuMbmaBKvM8jmSDSoTZkiDK5VF0cBhHBPtlFjZcRVjUXLgHEu3GJ/1dasGAVcxGtyGAqz4n7
	dfdg/xQfuiZmC91jVrnrjBAj8T7OcXGBVkOsD3IaEG9Zpovxk/mqQgdQqKWIIrOdIgqYoSsoBXT
	Gm1pD4HtYh42G8hDwbr6+LLANheQYYTWJl7VIyQ+6TpEr4XV+QaiIoD/XHCfUBx0RwGBe68rNqm
	+BoEC2PkP0gxlKHCAFyTAa0LQkDp1MuKhiTT6nU3Auwk9m6zqJrEuLnsB89832vYmuD1FPgnN7f
	csBhhU6iKIeZHAOZU84lF5Lfy
X-Received: by 2002:a05:7300:3721:b0:2ba:7322:6bcd with SMTP id
 5a478bee46e88-2ba8cc89047mr179670eec.3.1770711769563; Tue, 10 Feb 2026
 00:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210053756.2088302-1-mkchauras@gmail.com> <20260210053756.2088302-4-mkchauras@gmail.com>
In-Reply-To: <20260210053756.2088302-4-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Feb 2026 09:22:36 +0100
X-Gm-Features: AZwV_Qj75jgKNxxldUxP7x9MHEjb0UnbouefGOQsNNhG76ZuqB3-iYmqrnpWbNI
Message-ID: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 8:18=E2=80=AFAM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> -``powerpc``    Experimental      32-bit Big Endian only.
> +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian=
.

As I mentioned in the previous version, this is not a valid level
(same in the previous patch).

Thanks!

Cheers,
Miguel
