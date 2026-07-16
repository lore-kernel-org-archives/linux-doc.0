Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249C833A718
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 02:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256107; cv=none; b=Tv46IcViSjtZgXR+hyANnOoFVhtV4UsmJCYMMDfrot911AROCiUIOk3oJ2OImhzpxA1sk+zB0h9fpiWbdPedYin4yMpnLneHqPdrpyUTCqoImDTw+EneIYV4t5RZP3oQ1mFvvR+wtORpHErB4RRnvTpO/IcQOEpEWrywbS+azOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256107; c=relaxed/simple;
	bh=O/Swl4p41vnXyf3QyhUiXUdXKMg+dvofMUMHqzzQhEI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eCVvhn21neHGNPIFEzq4/wM07yP/VV8eQRkAppRlzbEJSKkQIS1knlmGJDNa9uH1qNX4nYrW6Mpzd3ULd7b+Wcr//OZ8ZyVtnj/f3rcC3RdvVkUZRIka1HURqMB2agHRwSIzUqaaVns71D6zkxMEsj0JXRrNIkRmfILVmIV66vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m61VX7HW; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m61VX7HW"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c160b9c0676so268180666b.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 19:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256103; x=1784860903; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DbIYBGDrxSWIIJNYURi+rPKwz3J+f2cnmzz2JP395M0=;
        b=m61VX7HWp/9Ncnpbc1SVBIMJGvlGvQFk0Fo/6xQswCj83wbh/dWYBTlyATyDQMBx/U
         Txs5u/v3E1e/qz81nGq+011hOe8lZF0ED9nD2+M/+SXqnhGxHHZ4LpmKtsUaFVFLwWAF
         /bJIuvdCDV0zqhgPiG/U6jOQiwWsqMxm7maTcJO0hUxo3w3VtouP05KgH+Nw25/bAJtR
         JvwvHMgVivuM+FOUbGzBuXuqt0vjsaomUcNNErp7QEmyNpzQSDoc85AkYAgIhvcUPrZt
         vBiwRJs0tYY/Bg//dFrcn/koL+NIBzWNLe9eFaaUXdG2IMx/vHyIn549rE4GueWCdO3h
         HxXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256103; x=1784860903;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbIYBGDrxSWIIJNYURi+rPKwz3J+f2cnmzz2JP395M0=;
        b=qB1wUBA4aLRyOlZi+CBJALTEyh/2n6iJJCgxVgjZdJy1qKUT+ifb1c5hIz4sW/F3wu
         EK4QZ6SmyJFEqPpJVrehJuu2KXbu6SmWtt4G6uGSRbaGPnQLsNnroviGrPQhyRbN1qzM
         l09nB/qc5/9cwWqwC5cIUQc/Ci27phJt1mh2MJNc2bOlKOW60uNsPqrFOJIBTGmIvbAd
         A47E+ZNsTQi7Bq7S7EEJwXh44VzL1+Mc6j9zuC0YjMCe0V2xPIPshkk6ZNXZSb9WuSbP
         deekJfk96p4QpHJE9W5EO+9d1MqPhzFDutzzRVXsL3xgWy1uSxQ4VQojHIgIX55zHNxI
         D9Ag==
X-Forwarded-Encrypted: i=1; AHgh+RorWvBWngKJXkxxU+y2/gM8wFxoh7Er+Gre/IcJ7qFiY7fFpMmTs4vXTu4innFNo4LJc5YKnWTvYj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxVV2QJ/No/etnSt+6M86ybrsOuWX4NjPNPbnmdmLL/BHjk7I
	PHTVNNEmiVb8QrcyIpza8oEL3jJBJjjL2x7fYGN21R3C422ihZq9edF8zs53sbcfKRXK+pzeJrY
	4y+LsxyTt0B1/r9kWxQ==
X-Received: from ejbse11.prod.google.com ([2002:a17:906:ce4b:b0:c12:6d92:3b02])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b0d:b0:c12:67e9:bf2b with SMTP id a640c23a62f3a-c16b4799b95mr19191766b.40.1784256102996;
 Thu, 16 Jul 2026 19:41:42 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:05 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-2-tarunsahu@google.com>
Subject: [PATCH v19 1/7] device_core: rely on put_device to free dev->p
From: Tarun Sahu <tarunsahu@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: bvanassche@acm.org, john.g.garry@oracle.com, mlombard@redhat.com, 
	loberman@redhat.com, mclapinski@google.com, dmatlack@google.com, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, jordanrichards@google.com, souravsgl@google.com, 
	stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, emilne@redhat.com, jmeneghi@redhat.com, 
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>, 
	David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

device_add allocate private_data for device and assigns to
dev->p. If device_add fails in later steps of the function,
it cleans up this dev->p which is not necessary because In
the next call, put_device free it anyway (if reference to
the device is 0 which will be unless someone concurrently
get the reference to this device).

This avoids unnecessary races introduced in system. After device
is added in device_kset->list by device_add and later steps in the
device_add function failures occur, it will free dev->p manually,
while in between there might be a user of device_kset->list will
take reference to the device just added by device_add. and might
try to access dev->p. So relying on put_device to free dev->p
prevents such problem.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/base/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..76ba02c26aa5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2614,6 +2614,7 @@ static void device_release(struct kobject *kobj)
 	struct device *dev = kobj_to_dev(kobj);
 	struct device_private *p = dev->p;
 
+	dev->p = NULL;
 	/*
 	 * Some platform devices are driven without driver attached
 	 * and managed resources may have been acquired.  Make sure
@@ -3824,8 +3825,6 @@ int device_add(struct device *dev)
 parent_error:
 	put_device(parent);
 name_error:
-	kfree(dev->p);
-	dev->p = NULL;
 	goto done;
 }
 EXPORT_SYMBOL_GPL(device_add);
-- 
2.55.0.229.g6434b31f56-goog

