Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369028;
	b=hKonBVPIVw9r0lYU8qG8wPd4QoIAtQzM5coXvwli/R7Qp/gRSkj3/j9YUKJecFtvLkpv
	 hVeIFtsT5QZQ3yMq4RDN5alsIhDMY7WGsMBZGDl9W/eoIEmW5mCWBdRJYwcJoK9LQ7GMG
	 iTJvAkBtMsf41vJQZgGbyU8mTspQ6eyyxYa8lnT2UB32fpGBQOaczIU9mQ7rq+VO6iKFl
	 wUsoqHUIcrUOb5N6e8jvV6n2zbfYsRLutQqkOOHD7H4qPrA8beJF69Rf+sxtSPfgFym3L
	 tjdCQATMaytXSTcQtl9buXUGdXoRqL18bCKKI6PSfpEK4VEFc4U35rD8z0sLCNb3O5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
	b=kkDVTDeLUSCZf+dG2scwunwnCXXdCsF5zpn3cOEjTW2wwA1VlrkhenA3YrvJbTtpW0dC
	 DAlrniUDp/Md92SaDMsJo722ToX8kKz1z9yXr4bbE5QIzIlMveLPbEwDMlnbQEBTwyIAo
	 4hQvu34BgBYyvgZvJd6owepZKIY997W2NtxSCB1jxjHuVghBMlAwkAFL8k/M2Hm6I3osi
	 SfkwVVRLyPZmt0JFqNtinldHGQbr19U6qQckhgr6kareUYrshh03lQ21ZN3zzeQpTXkgm
	 7OTh0shLrFX1fNZpY5MQx6xEqzygLnN8XgDD3OZW06oGuPIAnlDIMWd6YS88DyadG6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="iUnJG/gn";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zdx+hJeE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34A1606A330
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 17:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D34A1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iUnJG/gn;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zdx+hJeE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795369027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
	b=iUnJG/gnwugc9yR60JCx0qIwof+yGfoqzfi9+BRqj3HDfwrYd2OzqQ55lg9P5nwOZbLUc4
	UW0XLuHtnEm0aW1/l+y/VTlmPS1otCvOQf8lWp6/yPDV9dNRk7zXDQw5snoYZCcjx77nXA
	3+AyamoNpexSWNq7hbCKdYWLKO2yWt0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-NQgMM_vENnqUsroJY95Kww-1; Sun, 22 Nov 2026 17:37:04 +0000
X-MC-Unique: NQgMM_vENnqUsroJY95Kww-1
X-Mimecast-MFC-AGG-ID: NQgMM_vENnqUsroJY95Kww_1795369024
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53661e036a2so51785481cf.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 09:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795369024; x=1795973824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
        b=Zdx+hJeEh0MenRAqMOKWJk2CUx5CVTYwSVhnSyUaOiXIxCSUWbp4Na9pLorxmly6hO
         mdrGBnD/yz7l82OVYHzDBOaBWRyQqXPfsYzNWareW2vOMCNWFbkm0qrfRbT97mh5U4aB
         UyaIrmOxtoWqLZf6JjML8oRf1+d9CabovBFKTr1AxQcfDlrhU4QPI13j+mni4g4Dkm1M
         wyI0RL+gqySNe39wKZJYHM9TWhdc/AkjdHTR2ywlKSJ9sbT9aaFaVJvF80aZtLyh41S1
         NxS7F5doQYEyYXgV3SiIdzf4TlhtytprQy5GTMwkqgF5FhTouQUN5g34cd1aGukq7a/9
         UB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369024; x=1795973824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbGrtGAYBDXJ6BhsvPEeazwnrpM+UIvWRxiQpjaPFH0=;
        b=ZHgH27XgCrfokd1wKzmnzIsCVZVQ6pUxM0BUsr4wNdDehBmVLngDi6Dvj2jFK6NIWY
         Mf3s+fRvZSo2s2WiyexIe5RsXz7cZbvZiNHAJU/DHnaVuSzE3MMWJx6p7T1Q37EyuHdZ
         eTmMte2LTLgGTQxAg2DcYY4hCWXpJ4K5wUqWYMzHsrhmHL2gBFQIBE/6YgCRMxccRL0O
         VRhXeRDlVxSRoCvYF/I54lwpdYvzIkgvSlDT9SNtwL3e7damE4ovf5nDJ+h7jAU7i4yW
         At3PQ18gcpY4rTVc/ZEQS1tkU+GbB7Aaz+8bVklajoqsyib4oz3ClHRm6Td//kRkCwmQ
         S0AQ==
X-Forwarded-Encrypted: i=1; AL+hErGBlBy/1ExfBtK0dgEAS6peVMJg40fnfoHmLajmaDvT7xTc7J+S5Ic4lmpNDeOF1gKJ1quH7GRqUbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VC+GbSvJcM8BfWach2HpVnnCzXOwQ7DZY6QvRjRluLwT0n3KP
	GRXDQqxRkdCTKJLe+rD+85ip1b9PLC2aeJCmQeEdE6K5v+K4037vfXfokC92VxA06yuTVds+Ruw
	gmuDyv9A0tgCnQVoMC8tajwsyDZqmL5CSInDtc1CT+3Q+f24sRfLMTEMNTPL4yQ==
X-Gm-Gg: AZFdTZc/SpCLP0TMLnlms+bxzhy3iCE6O+W9vXjISYQlZ3s9dGlXjsLAjAcGELu3hU9
	UplzFm9GYws3Ksm0MJXEFj91yV98rhVXLCIQrfWh3m8Bo7rurCjc0qVti2BOXbvwbgHUL8bt+GR
	DEfm4MvSyIS2f+Qm33TzldrC8q/fjQGRuLc+NhyzX0sdYcsTGGj3gtmsBnwH+qogNxl31wXA/jt
	9QPjM7EvRww3lCPnnt9VooiGwye0lzPrn0HED0NenJDnQ2eyi3fPANUyYmSM/JrnLRLCFYe23vc
	O19WOPTMS0aaZVXTw+X/udI/KUh2Ks1EmSVqeXHY2TBgilM6daz0w2T/D6bhVyWZr/Bh5BIdrlu
	iy1AsGILge4tmgXGuEmMyYwlH6WBHkyndmJF6gVMQW0RSoyt1g+ExqsM2AKnsSeS3JcNL6BaY+Z
	O79bX2jQB/qYI3Vunc7sQqlbvMDyJYFxAEQ2anCBWq2J73gppMO0jPnUX8bGB3NwtwPAupwsMiw
	fDRoZ2Vh1nprTK/YAo91QL9pkrGfFetZ/bJAvbbulCFot65UPLN
X-Received: by 2002:a05:622a:308:b0:55b:f621:e7cb with SMTP id d75a77b69052e-55d76a6e9eemr177660991cf.21.1795369023931;
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
X-Received: by 2002:a05:622a:308:b0:55b:f621:e7cb with SMTP id d75a77b69052e-55d76a6e9eemr177660721cf.21.1795369023504;
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm71310051cf.5.2026.11.22.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:37:03 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: Daolong Zhang <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ceph: add compression_hint mount option
Date: Sun, 22 Nov 2026 17:37:00 +0000
Message-Id: <20261122173700.1281165-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1795169573.6B001D21.006.4jWB3k0l79z3mds@fangwg01>
References: <1795169573.6B001D21.006.4jWB3k0l79z3mds@fangwg01>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daolong,

If a mount starts with compression_hint=compressible and is later
reconfigured without that option, ceph_init_fs_context() allocates a
zeroed options structure and ceph_reconfigure_fc() unconditionally
copies its alloc_hint_flags into the live mount. The reconfiguration
therefore clears the selected hint, so later writes stop sending it even
though the compression option was not changed.

Could the existing value be preserved when the option is omitted, while
still allowing compression_hint=none to clear it explicitly?

Could you also check that the patch applies cleanly to the latest
ceph-client testing branch?

Thanks,
Alex

