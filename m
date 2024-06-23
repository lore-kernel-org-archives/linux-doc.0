Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E6D181311
	for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719161190; cv=none; b=NQSDKuUbNDjvJ22xddPIHx/8iJfOT+K2T+gWdTR+99qcELCAS9bZVkFMeH2clNDkNUmqtp5ONJbfCBVW/M4HMxNaAqUetUz6mjyoyqZG1QFBXYJYIgBomTdmD32J96R0D2wy11i21Gaw3NcAXswoPliwwFoo41K2hdU3hfpull8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719161190; c=relaxed/simple;
	bh=ktLTDh3yONNNk5qCL8pEySQq66gnDnzOPy9c3BlgTaQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gFFtrDkFnoemFRm7fm4oJG6EqAY0V2xeMOBxfjAx3EsNPbk+MICwJVUh1WGEkwBCG0cLEek/uSkWIUr8BRZbXtgrtXkdR/UdretW5jdHyRtxZQlTp3frN3y82GFZnxPnBzBrKCDq2IWuOTI5S0HBocj1ULXz/B3Awf1JrkT3IGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wWG9xImM; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wWG9xImM"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6438cfe5af9so20469437b3.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719161188; x=1719765988; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R9lWbmtvD/FtBKC/4BvB1Rt0D178vL9nREKAOaVsONg=;
        b=wWG9xImMvPD34nLxREd6pYlyXCnsSaUoFzOZGnZ8LwccXkeUdI6AJYoqbo/S57Cd/l
         CQzy4Lr1n4toSExC5mlO6sYY7rjOxwCwu+4moN/cAX+KEafR0jaIUblGDJDwyETq/wt2
         vz9KSUn6qHQlGl7gE4g3UvH3vj50xwt51XVOelUB7wA+tV5YRO9EizRi48x/3MiRvNSp
         +VroGl8YdIwJROeI+eHtgdP/fJFw65VTpaueI27xdp3nu347+NqDxc2H3Ui9HY5Lwq0C
         nLcLtWgtzXhnUElRF4FaIPLpp+08IdJBbPVGC3B31z6bw+wmQzNORd5KYDZKH3rToFAX
         DUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719161188; x=1719765988;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R9lWbmtvD/FtBKC/4BvB1Rt0D178vL9nREKAOaVsONg=;
        b=QBoWw1aFe+wJRzW7TdBelOiyc8WbiZU7rT77nQohpXZymi7A4yGJrt+M9H0GE670WW
         DJSFcBmb6xpt23kLye0UkRm/Ec8/YTENpi+xpv3a+vUoXYGKNfHpcupiloNvdoaGh2+8
         4IcVnKikOQN9siZncM64VQjv6MFHXbD8HJLPNPr4eDdFJNTq4I5hp7aArJQ6IhLi55ip
         Rrv2qOX0x0F2bf8IafcPetPJtOfrVVPfzcPzpYBZSe3FkbcR++LGveiTGXqdPR7sCb6+
         9HPhiqqmYVg6fTo/jPyCzEM2hZplmxTyZ2V6RzwpN2n7YUirRQileYtAwPBpCFIXet0e
         WfKg==
X-Forwarded-Encrypted: i=1; AJvYcCV0CyiFnz4Dqn75hFxOPUI2vU69Jt92jwx+M9J/OG8N7Ad3shMqDDA6l6E7sH9KTIZqFhFvzl/hrdTzLA5gQCytSwdys77tVhBk
X-Gm-Message-State: AOJu0YxwyG9e+ASLThwsSTnoSlXRUnVFKgkUHO6AmDxRrYhDdoaqOFej
	TS4QtgdgLbyCwX2XfLmwsfiPRGsDd2kdjSBTN9an6oGnT2GxjsWEvkIcswsWIuUKVZSvVs+W3vc
	Z81lo+U6VmoUIkx/uLw==
X-Google-Smtp-Source: AGHT+IGjc/K0I2YSI5AvzB60q+qfp5+lcXp+Wztq+8cPlJ8fEUgX5e62SCaUOpwgRwZE9H7J1KWleU45Q1kaYkQH
X-Received: from changyuanl-desktop.svl.corp.google.com ([2620:15c:2a3:200:c9fa:2a0a:34fc:4e66])
 (user=changyuanl job=sendgmr) by 2002:a05:690c:7201:b0:62e:81e2:99bc with
 SMTP id 00721157ae682-643ad5c66f2mr146137b3.9.1719161188243; Sun, 23 Jun 2024
 09:46:28 -0700 (PDT)
Date: Sun, 23 Jun 2024 09:45:39 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240623164542.2999626-1-changyuanl@google.com>
Subject: [PATCH 1/3] Documentation: Fix typo `BFD`
From: Changyuan Lyu <changyuanl@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

BDF is the acronym for Bus, Device, Function.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 Documentation/virt/kvm/api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a71d91978d9ef..e623f072e9aca 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -1921,7 +1921,7 @@ flags:
 
 If KVM_MSI_VALID_DEVID is set, devid contains a unique device identifier
 for the device that wrote the MSI message.  For PCI, this is usually a
-BFD identifier in the lower 16 bits.
+BDF identifier in the lower 16 bits.
 
 On x86, address_hi is ignored unless the KVM_X2APIC_API_USE_32BIT_IDS
 feature of KVM_CAP_X2APIC_API capability is enabled.  If it is enabled,
@@ -2986,7 +2986,7 @@ flags:
 
 If KVM_MSI_VALID_DEVID is set, devid contains a unique device identifier
 for the device that wrote the MSI message.  For PCI, this is usually a
-BFD identifier in the lower 16 bits.
+BDF identifier in the lower 16 bits.
 
 On x86, address_hi is ignored unless the KVM_X2APIC_API_USE_32BIT_IDS
 feature of KVM_CAP_X2APIC_API capability is enabled.  If it is enabled,
-- 
2.45.2.741.gdbec12cfda-goog

