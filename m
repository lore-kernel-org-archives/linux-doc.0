Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DF114D6F6
	for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 11:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489222; cv=none; b=mNdqhJ1Vf+8TJDBxnKWGlddMqk9YLFjhbRpcI3y2iVOqVy20A5kDzlvpYPs2Jb5V8WEqwbbUYwgSlM5JIyskukm2fiqKTfMucn8Fta8Nu9fc0tHqtHD71jDDnHmZrvZMoS1OMyugUHmwaz6ekwM55T4E8dDnpgwDw+10gFvcihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489222; c=relaxed/simple;
	bh=WpnKLjyFgPP+Ets9M+udfSNPE/YG1Fx4YKF8lUJWlY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aq4FRBHAnZC4LhE6Yy0hEPc842Hu+JcYst8E9/NcFxGP11GahfEKwcJEWYzeQ45Hv/Jdfpj9sMus0/Jt5J+GhDxVDlK3adKGRCYwVVewoWfBg9WgbSCutRGWeqHBOF4PL+SsNrnoVn7QUHsxe5Cc+gCWLHjkVuS3ebEl54TNS7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbfVoKv5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbfVoKv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719489220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WpnKLjyFgPP+Ets9M+udfSNPE/YG1Fx4YKF8lUJWlY4=;
	b=IbfVoKv5v8OVGaYOvyDTOvSkRIxYkezon5TUapUit8B5eJVqRP67B9qcuc8a3CQHLsU+J8
	pDcZ7sr1jsUn5yHELSxHaLc2s2Zt3P5qCcvSx73+6vSBZtYo2ijXt2JChG2NGkD3GAN39G
	EfxI+X6V3CZVB5nkDS5MXz81R8zM+Qs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-OzqjY-8iN-y7vx-uyqhkwA-1; Thu, 27 Jun 2024 07:53:38 -0400
X-MC-Unique: OzqjY-8iN-y7vx-uyqhkwA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52cdbc21fa2so4376095e87.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 04:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489217; x=1720094017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpnKLjyFgPP+Ets9M+udfSNPE/YG1Fx4YKF8lUJWlY4=;
        b=uMlClIkRZnnk7eNQNx9UKqXhk6FjqpHcU8rxBXaBBC4DOT0FEYja3JBXdcg19bmuPd
         MasH636lFRYC4A91uofZha4C+nHhoHmmxyHxyesCHp9JxqQj1znTMzVeqvE0bH+MkIHB
         XqBnKIJobUOy/a8htfqmhf7KIiQd/lUk3RRVE1XySgyuoQKqI9Lthrg8BTBHwqXaIvye
         5+AOJgH8k0r/yIO+Epzu060/k0FJ0gpEdJVzhcL2dAo2YGgIh1CBgBWtJa825IP15sdp
         JrBTOMezLkl2DhO5J2pPbTlklrRaadYmjag5QMfipMdZ6ZSYYnaxJCT1ivVs0We5QFbb
         9OGg==
X-Forwarded-Encrypted: i=1; AJvYcCXOcv1xTuroI84xxMozuxfeUr13tbicxBYKK0DcRCqElbWU/X42nBQOhGOGBjyW6+AlPRLiLxQ+KRGEt6Hz0eVFRCh9eLf1Y3N2
X-Gm-Message-State: AOJu0YynsmB7oKQws+5rTJdgo7aFK2l8Np+YV8HZCK1dZ7gf3hUov/Yv
	e3nQVusg55unBe7nc4lPD8WRFFHcaRXtsUEsuwpMXW0hgO39fbiaHFE2HRJOTy/mi+3qdlLSn32
	dm4dKH7mSMn9Qkgqpl8CRTaddEI4RIql72iDlTwiiuNi6JsSjEAgrBbI2aOz26b+YleYnA2N/qr
	rLHOjEbaLANQcf6rT2hf2d4wUrgZ4ZEtCC
X-Received: by 2002:a05:6512:3e24:b0:52c:dff5:8087 with SMTP id 2adb3069b0e04-52ce185f998mr10037871e87.51.1719489217130;
        Thu, 27 Jun 2024 04:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVZkch36jx3t2rXBnTt/tJtT34J4upClKCoBSCjCIfxSyDf5KG5q2i5WyOx4vaWFRZaf6v+qOWumAAXaDaRXM=
X-Received: by 2002:a05:6512:3e24:b0:52c:dff5:8087 with SMTP id
 2adb3069b0e04-52ce185f998mr10037850e87.51.1719489216776; Thu, 27 Jun 2024
 04:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624095902.29375-1-schlameuss@linux.ibm.com>
In-Reply-To: <20240624095902.29375-1-schlameuss@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 27 Jun 2024 13:53:24 +0200
Message-ID: <CABgObfYxZZdwe94u7OvHPUx+u4fDEJLnBEQbk1hdYs_Zy0D2hA@mail.gmail.com>
Subject: Re: [PATCH] s390/kvm: Reject memory region operations for ucontrol VMs
To: Christoph Schlameuss <schlameuss@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:59=E2=80=AFAM Christoph Schlameuss
<schlameuss@linux.ibm.com> wrote:
>
> This change rejects the KVM_SET_USER_MEMORY_REGION and
> KVM_SET_USER_MEMORY_REGION2 ioctls when called on a ucontrol VM.
> This is neccessary since ucontrol VMs have kvm->arch.gmap set to 0 and
> would thus result in a null pointer dereference further in.
> Memory management needs to be performed in userspace and using the
> ioctls KVM_S390_UCAS_MAP and KVM_S390_UCAS_UNMAP.
>
> Also improve s390 specific documentation for KVM_SET_USER_MEMORY_REGION
> and KVM_SET_USER_MEMORY_REGION2.

Would be nice to have a selftest for ucontrol VMs, too... just saying :)

Paolo

