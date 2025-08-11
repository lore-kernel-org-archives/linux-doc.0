Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1D255E27
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923222; cv=none; b=gNgVZv9rXhT/Hmbj+GlkXoJT/SL4d+BqqfMt/jb5481+zWO3tbZxPCi0p8RzzN5OufSaHMIohBFL/dE4o6+Q/381s5+DLlCOHl6eVTF8jHDMhIqnyHA7MRuq00uYRs/wR4TnOz1p+MHFv6jufUghrITpn7D9ThdRwg1SZd9F8tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923222; c=relaxed/simple;
	bh=JCwKN/gKooAaFsdJjTeTpmksD4d6hSpDciiIsTpGGA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmdlIxUvAjVgZv7W49EurFFzoIwh4mjkCCzKij+lchGUOHBB579klqoMZvrpIugXYtbUbGjnIk7zXwy0r8aqPMoGPD2yVDgVpHmEpTyMrhzEPvpK5w3Km2MXtt7hhuaPF/RwadPgdwva52D1YPVqoKXAJnlbkWYcjhrvsNXRK68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EPBKjUGF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EPBKjUGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754923220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/vseH74gaR1iaEZ4C84tjsopowUladLiE/ln90Ttahc=;
	b=EPBKjUGFRUvA5atOVvqUMcGtzxa1Q3b9iG659gXxLS4csz3zArImSh4Twz7Eo1IpMeVjBN
	HbdPAOkYaMe1c80AB0OsLk9Ud4Yqv3OmNV/Zzy6hF/VgYLa1EOg2IYNN9J4vxP7yzj770E
	A403Zqxel+ycOMQYkjv2GKriJFjoqQ8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-d8snhY1KMhG17Asi_BhFVg-1; Mon,
 11 Aug 2025 10:40:17 -0400
X-MC-Unique: d8snhY1KMhG17Asi_BhFVg-1
X-Mimecast-MFC-AGG-ID: d8snhY1KMhG17Asi_BhFVg_1754923216
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81C4419560A2;
	Mon, 11 Aug 2025 14:40:15 +0000 (UTC)
Received: from p16v.luc.cera.cz (unknown [10.45.225.214])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F257E300145A;
	Mon, 11 Aug 2025 14:40:10 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next v2 0/5] dpll: zl3073x: Add support for devlink flash
Date: Mon, 11 Aug 2025 16:40:04 +0200
Message-ID: <20250811144009.2408337-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add functionality for accessing device hardware registers, loading
firmware bundles, and accessing the device's internal flash memory,
and use it to implement the devlink flash functionality.

Patch breakdown:
Patch1: helpers to access hardware registers
Patch2: low level functions to access flash memory
Patch3: support to load firmware bundles
Patch4: refactoring device initialization and helper functions
        for stopping and resuming device normal operation
Patch5: devlink .flash_update callback implementation

Changes:
v2:
* fixed several warnings found by patchwork bot
* added includes into new .c files
* fixed typos
* fixed uninitialized variable

Ivan Vecera (5):
  dpll: zl3073x: Add functions to access hardware registers
  dpll: zl3073x: Add low-level flash functions
  dpll: zl3073x: Add firmware loading functionality
  dpll: zl3073x: Refactor DPLL initialization
  dpll: zl3073x: Implement devlink flash callback

 Documentation/networking/devlink/zl3073x.rst |  14 +
 drivers/dpll/zl3073x/Makefile                |   2 +-
 drivers/dpll/zl3073x/core.c                  | 362 +++++++---
 drivers/dpll/zl3073x/core.h                  |  33 +
 drivers/dpll/zl3073x/devlink.c               |  92 ++-
 drivers/dpll/zl3073x/devlink.h               |   3 +
 drivers/dpll/zl3073x/flash.c                 | 684 +++++++++++++++++++
 drivers/dpll/zl3073x/flash.h                 |  29 +
 drivers/dpll/zl3073x/fw.c                    | 498 ++++++++++++++
 drivers/dpll/zl3073x/fw.h                    |  52 ++
 drivers/dpll/zl3073x/regs.h                  |  51 ++
 11 files changed, 1729 insertions(+), 91 deletions(-)
 create mode 100644 drivers/dpll/zl3073x/flash.c
 create mode 100644 drivers/dpll/zl3073x/flash.h
 create mode 100644 drivers/dpll/zl3073x/fw.c
 create mode 100644 drivers/dpll/zl3073x/fw.h

-- 
2.49.1

