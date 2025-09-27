Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B719AD48
	for <linux-doc@vger.kernel.org>; Sat, 27 Sep 2025 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758962980; cv=none; b=Q7K4vwjU038mR53MFp0E+9wH+sF4Emn9BdyGPunSxSVZXqDzVSuAi+rNVmSlL722JtI2WeFnkTXSGG9BP93oCpuJJv9szmrU+bJoOGiDXi83wmg3xr5/4zjqVGDei3qpuWpzLnvxF7pbcqKJR6JuIlUZ0DXDqUSXeSl2vSj2WGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758962980; c=relaxed/simple;
	bh=Xbd4IBcFdDpKJyJon96xzhV7kbT5pBt+z3Ss0qeoKRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tURCsuPTNIxYLb/pXb9yojm+gXYQgpJ5+cVtegv7EE1Dylr0UjVZGW4YyEh+fOevNZMHQ6dRgSmsD54exB21/H1P2QncrWJTe5wQzNiNaQCGKckDwUcd4svEXxPhNIMvG7kPT2bFMbXSwlOlsGRBLjV7mqiSviVWdsLJ9m6nWeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVO6NUEc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVO6NUEc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758962965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K9u9IXqfPjTiCjIxjNWCCDv4KZnnzChMeXmXwjNiBlE=;
	b=MVO6NUEcCy5RrFamSQT6/Mq0dTfZ0zQTrMhxhGNOX4dKCYtEwlTT6fAQAlMOmCyOsM7ZqC
	w6f77gWqWoVJyH/5D8pnMTFHG52Z0/tp+Z2n0jypuTG9Xo3CPccZlHjDR4iBt9+pwUSdev
	g86XQ/uMHlkQv8iSnoM8ITIe92gU1O0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-170-HOnfv2MUM5isiZgU5GHcWQ-1; Sat,
 27 Sep 2025 04:49:24 -0400
X-MC-Unique: HOnfv2MUM5isiZgU5GHcWQ-1
X-Mimecast-MFC-AGG-ID: HOnfv2MUM5isiZgU5GHcWQ_1758962960
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B9D2180047F;
	Sat, 27 Sep 2025 08:49:20 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.45.225.247])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0AE919560A2;
	Sat, 27 Sep 2025 08:49:13 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next v2 0/3] dpll: add phase offset averaging factor
Date: Sat, 27 Sep 2025 10:49:09 +0200
Message-ID: <20250927084912.2343597-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

For some hardware, the phase shift may result from averaging previous values
and the newly measured value. In this case, the averaging is controlled by
a configurable averaging factor.

Add new device level attribute phase-offset-avg-factor, appropriate
callbacks and implement them in zl3073x driver.

Ivan Vecera (3):
  dpll: add phase-offset-avg-factor device attribute to netlink spec
  dpll: add phase_offset_avg_factor_get/set callback ops
  dpll: zl3073x: Allow to configure phase offset averaging factor

 Documentation/driver-api/dpll.rst     | 18 +++++++-
 Documentation/netlink/specs/dpll.yaml |  6 +++
 drivers/dpll/dpll_netlink.c           | 66 ++++++++++++++++++++++++---
 drivers/dpll/dpll_nl.c                |  5 +-
 drivers/dpll/zl3073x/core.c           | 38 +++++++++++++--
 drivers/dpll/zl3073x/core.h           | 15 +++++-
 drivers/dpll/zl3073x/dpll.c           | 58 +++++++++++++++++++++++
 drivers/dpll/zl3073x/dpll.h           |  2 +
 include/linux/dpll.h                  |  6 +++
 include/uapi/linux/dpll.h             |  1 +
 10 files changed, 199 insertions(+), 16 deletions(-)

-- 
2.49.1

