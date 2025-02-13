Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAC220764A
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 19:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739474144; cv=none; b=iG3bpj09Mpq+VvDeQTGxUqoqOCIRY/Nk1XmuIPZ0qJ7qbErkZKodTLGKXSaVF9M2tzx5OQCgrzQbnVWcAHUK+W8wQGFO6acIooPnoU86jjQ1NSKa92miq/do1vYcSGCu/PvEfQG24oEzHSpF+CKR5+hijX4l1wIDl1sbJbjqf7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739474144; c=relaxed/simple;
	bh=Mcdq9EaufE8ixupJ8HB9LDd3omoIn5ApfoYJI+Dq5ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdj6kStJ+nPnTo/8cDRNbmB9DegIxx0r/h7Gqok2A0U2IkfKZKCh/iNcKlh1NZDF29aNKkTzN9K+7RBj1oxKPjEtFg0Re12klTRI7LaZNAzNfdi7PBwugX5EtGF2eoamxAwGYeLiLh99fJzYWHFqnzlC2MOiMkE0KOW6K4PVMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=Oe0txW2P; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="Oe0txW2P"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220e989edb6so7952845ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 11:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739474142; x=1740078942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyit1NGNsESJfteda0OrtegLwM9G4amK+tirz5wwWg0=;
        b=Oe0txW2Pp0ST/VpMj2vL6fgepPCPh0jp3I27qk4Be7zwzG6OCpAnVWgbkpDZK/Ycf9
         BWgMTaxCB8HVgra09+R56P66PEAOIcufak6ETk8g0wOOuELWg/ImowRizTP4GrUNXuWt
         4jG0eaR2uI0+NUg22g7QCMKkIyQUxaPEyW+NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739474142; x=1740078942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nyit1NGNsESJfteda0OrtegLwM9G4amK+tirz5wwWg0=;
        b=tpHLOF/V34sMPfGK0Jorwsmoz8+NLtMGGFk4vlNQ2cRzlYFEURnCxZoaBd5Z7KEKWB
         d2CL7u0W3XAGd421OIfLbGKjjNJmFuyRTT0xOMKdM2H3huY9JojmimVl4qFlbSo24aHy
         qWSwFbAde6yX0/++2aukPNyXdnKwbdZ+om2Nt+UWVd/cPxo7hFXXBm2ganEgM/jraSYv
         MZIK6oqInuz79vGoTP9G998Mg32wmAVZFrnlzpcZk7c0z1mJD8TF2gqovWxN3W450/Lr
         N5QSAJqPPLvsC2RdD1UW5ncY3MppMQC1mPWOmuowxod7x9cr1lxw/m4qR9fD7oMSZAYX
         +qbA==
X-Forwarded-Encrypted: i=1; AJvYcCWSu+TCSkOvkjw/bMMLaKN9ayJSiEUQ/GZU5XJlByTTBMYpAJJWDCIfDEIaM3k77CZpD+hBaBydcrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzawgsishvMUQfNs4JXQ9nhu2M5Lr2JoA1687q8PEtln7+lNaJ/
	wmoQta6pQjMOZU4Fj7k0tIhGYtDcILWh4VVR+grORphwEjTaDw4F5KITyquSaCc=
X-Gm-Gg: ASbGncslquubQgWDVMwrSj+f8U7w9B0ks0Iqn30hQlONDl3MW+YMs4d8kgcOyLZ5ufh
	+CUpHV1NI/uIWlCBsfy/fbhqvDrJ4Up9TT70dyHaFW6+eq4kJAK9+KnFbHANVTaxI9EUtp+XH+b
	7qchq+/7Dwq5HxkU8cBX6uL6EzsFhnPDiEHQT6gsTAbkKwJeTbKR93tdI9ry1x6GhNkBqQdzGts
	KRAUMa5C8hJEWT18YdMVbMD0o6BU8H+JDKAJrnckXxBF4SBrfTrDl/E1ohfdhsQ3n8U8MsAT34H
	3TEiqUumBXN2lkObq5j6odc=
X-Google-Smtp-Source: AGHT+IHNmMFdpBQPl6o19vnV8i77junBI6CG2QTOtTi2iQjCu5Yp5w2QnY7z2J4pe6EHaQ9BeabrdA==
X-Received: by 2002:a17:902:ef4c:b0:216:2bd7:1c4a with SMTP id d9443c01a7336-220d20e89f3mr65785415ad.26.1739474142099;
        Thu, 13 Feb 2025 11:15:42 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556d4d8sm15553035ad.170.2025.02.13.11.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 11:15:41 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	bagasdotme@gmail.com,
	pabeni@redhat.com,
	rdunlap@infradead.org,
	Joe Damato <jdamato@fastly.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH net-next v3] documentation: networking: Add NAPI config
Date: Thu, 13 Feb 2025 19:15:34 +0000
Message-ID: <20250213191535.38792-1-jdamato@fastly.com>
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
Acked-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 v3:
   - Add tags from Jakub and Bagas.

 v2:
   - Reword the Persistent Napi config section using some suggestions
     from Jakub.

 Documentation/networking/napi.rst | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/napi.rst b/Documentation/networking/napi.rst
index f970a2be271a..d0e3953cae6a 100644
--- a/Documentation/networking/napi.rst
+++ b/Documentation/networking/napi.rst
@@ -171,12 +171,43 @@ a channel as an IRQ/NAPI which services queues of a given type. For example,
 a configuration of 1 ``rx``, 1 ``tx`` and 1 ``combined`` channel is expected
 to utilize 3 interrupts, 2 Rx and 2 Tx queues.
 
+Persistent NAPI config
+----------------------
+
+Drivers often allocate and free NAPI instances dynamically. This leads to loss
+of NAPI-related user configuration each time NAPI instances are reallocated.
+The netif_napi_add_config() API prevents this loss of configuration by
+associating each NAPI instance with a persistent NAPI configuration based on
+a driver defined index value, like a queue number.
+
+Using this API allows for persistent NAPI IDs (among other settings), which can
+be beneficial to userspace programs using ``SO_INCOMING_NAPI_ID``. See the
+sections below for other NAPI configuration settings.
+
+Drivers should try to use netif_napi_add_config() whenever possible.
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

base-commit: 4079918ae720e842ed7dff65fedeb9980b374995
-- 
2.43.0

