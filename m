Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0A22E3F0
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758052962; cv=none; b=WbLTQwGtDPMXjIQTpJ8nqWKrKSF6ux6Cx016Hlt3BJGiOZZKvgBFX8/nKgUOmmfUCwBMQswBIDSQZR+C/yJSjjgZIG/jAXkElC10EXACFX/j+YHmF/A9umFUSaGiijZtl0KSihPgO+iw3RrcjAnUULRqXJ7nXRCIhihh9se+mzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758052962; c=relaxed/simple;
	bh=LLu1AACh5q522Nr37rB3izBpVJgz0C5vXI0RUs0TrRM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DCYIsgaEV422YSek5j0b0nXXIs0wToUpm1T+wknse9XDNOLtqqCZ0Rb7z5sqZPPe5JnqvDVrCFlDVy7aLvSnZRi96LxHVMIgWw7uV4by+qft7eoOKhSsq2pf/k8qKTIXYBXUl+a7ScuICZfc7f6W5Omg9K2Hi3i6S4ngRBecVqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UEMcJ3Gv; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UEMcJ3Gv"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b4d3ab49a66so7963911a12.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 13:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758052960; x=1758657760; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NDPBVUVtayrtvgwZw5aJFImyZz5WI+omxTmlAGFmthM=;
        b=UEMcJ3Gv8MCrq59TL9IGgRgfgdDGsPhA7PuLSJRWF9HzRLAn7rgZyryJadY13sEfZN
         STNUANu1N2y0q2N5FlEuc0/NWWVyhwz5uuJnMZm8QKGl06IoA3p5VW/zVusoN29y4Vr8
         mo4gHYBDM6Q89bbL90VqZJ367Aj+OaMxjApK2YP8y28Z1yymUam2z+1yy95XbtNrIejO
         ChzIxxFechftu/U5U/wBDT0gVEP2oKlxwxnZ60hDmIh8CoIilAkFWUO68io3OwG8HaIf
         h+fMmPkDJIMBKuv9K1eKiHLTJXQRsJtL1xOOhtZtUC26DKRPRI+Qg8o83Un9LebCwswz
         uqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758052960; x=1758657760;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NDPBVUVtayrtvgwZw5aJFImyZz5WI+omxTmlAGFmthM=;
        b=HJWBNnevut6dbubJtDE2V6G6LbbJDzDhS5mg7yN+vBQ0Dr2igrwvernbOrjZQKo23z
         RFAfOOOibk0qFEh7yqljfoIsHyGxMDEvicXJbMBkC+8j6kCIaVN+w6uCYYQCzwjYQdQs
         tzUFO6AqelqfNuCP3wrXvhg5GKE2ayg32HreCvTm6tqMnD0aBepgPx/7WtKuWasvsr27
         MQuc1559b70viSPNGolUwQxPIU+HGGwaNFL6T/+rt1MkUB1+gJw0SLMD9jVfg0WlAT9X
         LJfJhWmxSCUUcPFSJpQB7EJ6+CifnfciDobQPZuiTflQKIYQ1Z3G/KO6Vh+BAVDPpsfd
         wc8A==
X-Forwarded-Encrypted: i=1; AJvYcCWUDx1G+yDUCXo9Z5rSljcumul8hODCfzHHW4ARSkGoW1227TNtO9xd442Ni3iIKydLuRtw7wHKtdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYy6l8/wLkdqIGxPJrftpeBYEozIjH2O2yWugUuInCsnBU+p8g
	dHkUtGvhPrTuFPR5nALYX5XCwVbnqvgCF91rDr8uDbtFpuTammdnQD0NBEIDKaUV0a9mzU8uqej
	uyCbhaw==
X-Google-Smtp-Source: AGHT+IHdkoO+jtZEzBO26MNHdXNyLDVSTI0DQhxv9z5DC0syuYZZVtivfQ02s4S5Te6oVnTkomW1LaOYVFU=
X-Received: from pjboh4.prod.google.com ([2002:a17:90b:3a44:b0:327:dc48:1406])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a0:b0:262:c083:bb38
 with SMTP id adf61e73a8af0-262c083bc6dmr15435648637.0.1758052959908; Tue, 16
 Sep 2025 13:02:39 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:02:38 -0700
In-Reply-To: <175798208800.624836.165612810420047605.b4-ty@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <00378f4c-ac64-459d-a990-6246a29c0ced@infradead.org>
 <20250905174736.260694-1-r772577952@gmail.com> <175798208800.624836.165612810420047605.b4-ty@google.com>
Message-ID: <aMnCXgLWN4xX6hjM@google.com>
Subject: Re: [PATCH v2] Documentation: KVM: Add reference specs for PIT and
 LAPIC ioctls
From: Sean Christopherson <seanjc@google.com>
To: rdunlap@infradead.org, Jiaming Zhang <r772577952@gmail.com>
Cc: corbet@lwn.net, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pbonzini@redhat.com
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 15, 2025, Sean Christopherson wrote:
> On Sat, 06 Sep 2025 01:47:36 +0800, Jiaming Zhang wrote:
> > Thanks for your feedback! I have fixed the grammar and put the full URL on a single line.
> > 
> > Please let me know if any other changes are needed.
> > 
> > Thanks,
> > Jiaming Zhang
> > 
> > [...]
> 
> Applied to kvm-x86 misc, but only for the PIT documentation update.

...

> [1/1] Documentation: KVM: Add reference specs for PIT and LAPIC ioctls
>       https://github.com/kvm-x86/linux/commit/3f0bb03b9db7

I force pushed to fixup an unrelated commit, new hash:

      https://github.com/kvm-x86/linux/commit/5b5133e6a55b
