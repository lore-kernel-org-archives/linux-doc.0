Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9926750AC23
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571266; cv=none; b=eJXJ4F+FhxmOVuZSxhOf9bcMnT3IWPdQbfpY9EcG7dcElZn8bq98q7KWnsKSBdLy+dWkkNSDvwTeFUwfKdXaK2kzo/fgOGTOyWpZ0jjOeg46cz6LojElyoXJuV7bTiYUdT0XWTShv6pmRNYAzCrJB3B6bfPBEL8Bh6gdDjtNxpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571266; c=relaxed/simple;
	bh=51IUJ7oH2GDK0isWUJ8WivKZY3H+6fuok9bV/QpC9Rc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=pJzYkoJqmiu4ErOqOrv/QuNqNtYwyFgHJqcS0+1/6hGxDTjBfKlyn/TwCX5v1VtuCuaxxxPwLUvLJOgmOEPSiUgfApWRXUGm8Cf6IDObmRAMfpqaqN9NREs2YIgSGFfwZq/C+Tsv5Z1ULBJ5GCnlDdN5Z9kO6tTpb5ApfiJwrfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BA3j6mVD; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BA3j6mVD"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8917c712f32so8243b3a.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571261; x=1792176061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7IaqPQoEOi+imp/PK24+/AW3BiTVn/zY6gW+WBVBCE=;
        b=BA3j6mVD5e+PCI8eZX4xwf0R+z3JEUR4vmzNqItQ9Ec/YBmpkbSJgX6qnm07C9YgP2
         pzLILEDo6wyHmbjB/NW7/Wyqnyg5ISfZHiF65M/27KSHzxhKHdS7s/nLI1BChRDrQdwj
         IX42spVLHKhguGVXnUnNRXdxjH4lBOSDfs4UjcVzQbxxfJd6DdrhoeqFVK4kf3eVTkAY
         jtHFN2lVGsehCJWqKtEZyvRgA/azXYGYeYE52wu8KOj2ufjJlpaQAKH7T4X08s9gswmD
         oHMdk/EgrtqX7JnJENcB/M6XaEewa7NlX6h9qJVs02YxV7ICni0jrJ8Pdo014LqxMxbB
         yoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571261; x=1792176061;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7IaqPQoEOi+imp/PK24+/AW3BiTVn/zY6gW+WBVBCE=;
        b=CfnOk7ercVfhqcEKuKekAt+m7Lqr29h2DLHSx9ieux6Y2EI7bHp2Hpy7elgbDvA+8Z
         uRQlcwa5tyMBQ84fYdFuiyJk+Dk1zYWmtBYplOCtumG797HsqR4P5sEozuiir2h/PuYu
         T5A8rPoLY3VE8fLKZGA/OIWypOvSWzE1QTwXz7oP80YyTbHcMBs5cfbInNVNDoOccBNx
         IGpx3err7j6g6fewJCiULppfUOS821gUKWuRc9AaT3u0SI7OONXeF7MCrNTwx4XDMA0o
         TkW3JenDhDNnwL+o9/a3tm3y5k9jlrwiW+HsW88KbtVqpZ6kPcS+3kgHGNiGxQiAkuvn
         zb3w==
X-Forwarded-Encrypted: i=1; AKwUvBzjWyLR6D5boJr9dYALyvclL69LvH0mJWZVHeYYY3TRD156GFoLRI5TUValmDLNywTUfhurDwgZ7z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf/S0BV0opY4Jz0aVAS4zTvm91hrCTV7dfwVQ7o5z3rz8i777j
	lLUlE2xjqCkodQ95XVqK4xfBKpqv0rD6FqOGboeAepE+L2WJ7UTc+55k
X-Gm-Gg: AYBFou2BE5OrDl5Z8rpQryIZjUD+4tYPRhnZrtcX5Fyrg34U+IDcCAS+jVkvIPiGW8F
	+SLYCzpqGyFWqIbK8vHEdDm4cLHj0zkxehVphVcKTZIo3TekKvPIoTd2cXTnp7hi7S/y5MEwIOM
	vbe4wJ4EMejailVAa5t++d8duSJH72cql5iJ/q2iUxJwbIsB1Kh/pfBaBlgq8I9o0VeglfNP2ii
	DgbZ2CRdQGsfmGKI/aNvvJac3s70trt3pJywHoixHqcimwr7hDvaZmO8hQku04CVGhxv4euU87s
	CTJE2s87S2PaNvlbNHwvK8levFwA9IQd9BVFc53zNBRPDBeGcREoMHb82ET/JCnKPXMHiPM1Z8m
	nHcwIe/kHfVVuY540RZxb5aEFezwczdijrXupS0pyWsGM8Cd3PMPJsfSQZKb0YD93U8LWSieWqL
	9qJVqkHPTp8drgXZK2cZH8/tcfqvb3LNNxLO/1e9RyZ3lHmBzcFhArUH9/0fdCOJ1a+0SLuvwE8
	BHlUxl1F6CVcSuDM9PYRqx8Mi4f8A8KlPH1XtxlCrPnhdnPr5x0LYSu3v/M8M1GyK7+Dy10/Zgy
X-Received: by 2002:a05:6a21:70cb:b0:3de:b120:bbad with SMTP id adf61e73a8af0-3e16be898a4mr2712134637.15.1791571261345;
        Fri, 09 Oct 2026 11:41:01 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e1ee81sm1513576a12.12.2026.10.09.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:01 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Fri,  9 Oct 2026 11:40:56 -0700
Message-Id: <20261009184056.7382-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have changed.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. vmbus_sendpacket_getid()
has been added. Update the documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v2:
* Add vmbus_sendpacket_getid() to the documentation. [Naman Jain]

 Documentation/virt/hyperv/vmbus.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..9c5b712c6e39 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -141,14 +141,15 @@ Three functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_getid(): Similar to vmbus_sendpacket() but returns
+   a transaction ID that is matched against a reply from the Hyper-V
+   host. Useful when the struct completion (or other rendezvous data)
+   must reside on the caller's stack. By invalidating the transaction
+   ID before exiting the function due to a timeout or other error, a
+   late arrving interrupt is assured to not trash the stack.
+3. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1

