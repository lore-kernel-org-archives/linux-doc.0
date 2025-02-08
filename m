Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC32941C
	for <linux-doc@vger.kernel.org>; Sat,  8 Feb 2025 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738978124; cv=none; b=EW+NkuKFBGSv70s8TmtnxASCme2EUA6N2ys9bqodUZdXuqDZIBLUoTFZaQrNPxuCcDqG1U6LqE/ju22PXv5/0cXaCETIoCsdZvo93KqV27ZrfuIpXGdOAp8UVExS4R1dx4zGEq8xU7RDTPvtN0IvJCH6inFp739II5JfF+9b8jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738978124; c=relaxed/simple;
	bh=F9r7BAv4PgGXAhDfk4jGDe5wzI28HN9K/csThIkDDVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXV6sbf33fPn3sKw4mgNG/21GLIlbSQbIgIsGTX7yhINrHdhPWl78hSaPqhtIsDqUyubRlPHo72VkV/NjakiOKjNfO0p8zTKu3LaFfpfDqoXM1E+i7ijeCXMvNtWzd4jmL27UW7WRG3oHfNRQ3mj0yyTyp54KJ5tle624Ejm6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=tNlsXaOG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="tNlsXaOG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f0444b478so40236365ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Feb 2025 17:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738978121; x=1739582921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/jz6zfV+DBHmvoxAFtAoktT0KBDhc6UitGswSFEQiw=;
        b=tNlsXaOGnJGv54yuug2TQ3l7J8AARZmDHRB0RfvP+SdqZmgieZ2iE6WYUxuCJGi5v5
         J1BkYe346Aeu2zEaLWgz7spm9X3X1YIua5YOpiwsYb/mutPxuBGLvd+c+89PAwjZvV7a
         9nm4RTKRXO1vN1iyGSZfCI7vhqEcksMGj6sDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738978121; x=1739582921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/jz6zfV+DBHmvoxAFtAoktT0KBDhc6UitGswSFEQiw=;
        b=fsBeKGVzov+oAMqEMNIwa8Y5IttyKU0Z0644/Zt7MD7FfczHLaby02Ei3/3M/9oVNn
         rtmXI3YARHMKsJdqiUAx9CohYRQ011vYwOByi2R/4rs2NreeSwKWSOSBWNSju/xIFBvZ
         7QdOXRNX2kcx0vp1r09xyH4ieNM9j4vx8x1SejkKJuAjhykUrRZRY5J3gDCDlOSeJzyw
         gEf13x8c1si00RjNsJLFO17I+xV/VBtyfe8T1X9JuNIDxT7swUlyE6fNYhtVdFHgfmJg
         A9zDnH1AX8iwnUAZxMY4or+m+IIGEI+2o5ITvYEW0uqz7M85BCfzVjmRfqOPFfrp42Cj
         gU2g==
X-Forwarded-Encrypted: i=1; AJvYcCW+b9SOQxvu5auNCrV0BvmXXJHAVrFdV1Tx3K5YxOA/VwPMmT9Lval7XNDk462Z1jT9Exg6ZjDlE9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlYDhwvTwguMpse2P5+PqYXsSrUiGlHECvrbjXxEa1CTf0fi6Y
	v0dROWssKoJHr0oEZw7MezJwUyRdgPlg422O3G0zLDF1zZyBahvhYGTcU0MIovM=
X-Gm-Gg: ASbGncvKoe8f8DyjEoDS80/Do572UspbBKj0Ziia7nJtAocLbAuDQKbmQKitrqGUT05
	+QS2EYTvGOZ0ug0uLydJfQeeVOJAtqa56gdY4IFJG4l8/RGOe85D0gFZZETr+WK7rrAyNQUgh9W
	9SO9JtYVsaZ4rCe/Ntjy10dXaDMGc9ONxlbStJ/Ui6OQCB4ay88PAT6HmEhvFQ6rdqDrWOdy8aE
	gE/yTB/eYN6CDVckhl8nhwYkPnjECZFuBn0yyIbnuAn+OawPlBC4YI99SH+l572zi0MDGfZSrOF
	D3DvGoJtjl8nsl4ao7cTtKI=
X-Google-Smtp-Source: AGHT+IEHMwYdGBJpLZD807RWAj5yJcAOhKgdcOa+RZW7NQ/Y7a8uV/knvJSk/mA8Tb9bfo/1eDkKWg==
X-Received: by 2002:a17:903:2f8b:b0:216:1367:7e3d with SMTP id d9443c01a7336-21f4e70b204mr80906315ad.31.1738978121181;
        Fri, 07 Feb 2025 17:28:41 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af7815csm3715311a12.70.2025.02.07.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 17:28:40 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: ahmed.zaki@intel.com,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next] documentation: networking: Add NAPI config
Date: Sat,  8 Feb 2025 01:28:21 +0000
Message-ID: <20250208012822.34327-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the existence of persistent per-NAPI configuration space and
the API that drivers can opt into.

Update stale documentation which suggested that NAPI IDs cannot be
queried from userspace.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 Documentation/networking/napi.rst | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/napi.rst b/Documentation/networking/napi.rst
index f970a2be271a..de146f63f09b 100644
--- a/Documentation/networking/napi.rst
+++ b/Documentation/networking/napi.rst
@@ -171,12 +171,42 @@ a channel as an IRQ/NAPI which services queues of a given type. For example,
 a configuration of 1 ``rx``, 1 ``tx`` and 1 ``combined`` channel is expected
 to utilize 3 interrupts, 2 Rx and 2 Tx queues.
 
+Persistent NAPI config
+----------------------
+
+Drivers can opt-in to using a persistent NAPI configuration space by calling
+netif_napi_add_config. This API maps a NAPI instance to a configuration
+structure using a driver defined index value, like a queue number. If the
+driver were to destroy and recreate NAPI instances (if a user requested a queue
+count change, for example), the new NAPI instances will inherit the configuration
+settings of the NAPI configuration structure they are mapped to.
+
+Using this API allows for persistent NAPI IDs (among other settings), which can
+be beneficial to userspace programs using ``SO_INCOMING_NAPI_ID``. See the
+sections below for other NAPI configuration settings.
+
 User API
 ========
 
 User interactions with NAPI depend on NAPI instance ID. The instance IDs
 are only visible to the user thru the ``SO_INCOMING_NAPI_ID`` socket option.
-It's not currently possible to query IDs used by a given device.
+
+Users can query NAPI IDs for a device or device queue using netlink. This can
+be done programmatically in a user application or by using a script included in
+the kernel source tree: ``tools/net/ynl/pyynl/cli.py``.
+
+For example, using the script to dump all of the queues for a device (which
+will reveal each queue's NAPI ID):
+
+.. code-block:: bash
+
+   $ kernel-source/tools/net/ynl/pyynl/cli.py \
+             --spec Documentation/netlink/specs/netdev.yaml \
+             --dump queue-get \
+             --json='{"ifindex": 2}'
+
+See ``Documentation/netlink/specs/netdev.yaml`` for more details on
+available operations and attributes.
 
 Software IRQ coalescing
 -----------------------

base-commit: 7bca2b2d5fcc685b81eb32fe564689eca6a59a99
-- 
2.43.0

