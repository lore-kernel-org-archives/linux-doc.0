Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606762737F9
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339666; cv=none; b=YzTxVqaoue8cIKsEDh/lHc45qCLB9V/ITKP7/UYGBuJjpmA2kmr8y4xUqupXrHaTh4ouEBthqUMDMgbTCaip/Swh7KqEpu1z8LZVKRDtBNtp/LJlFHkwmjvsUzaFmir7digWaC8q67jl+TfK50WIGp+VIjjRn905TNH5RQwvoww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339666; c=relaxed/simple;
	bh=iAhkuxtvlLCx3FI2+LZ2MUKk3NrR4LQpjDFB2p7NYFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UWhVvuB/9pZGI+/CWO//wTJDNYbPZ+X2xmqM8UkszKV4xQStuKTcH666mxv9f0BR4ImKPh3c7RiRYItU6cZGa0PrIcPIMDurdZUBgyG5H7MFtj58yHACNKm1zslSI9Vb//vaYOzSqV//EyUO/Q2u21I3qeH4SIbP3Q9r2u77lzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3e0f19a38d0so1263662fac.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 06:21:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339661; x=1764944461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bcATxuNlgaeDAYpQM6zHeyqMLPCvdphcTT8Pi4GZRCI=;
        b=kKb3ttTuGcNCJ8nUTy0nrNNlWdvQSi+EzoAYqS+1Nc/4oNVk4bC9Y/Gvp3IrAyaUwa
         ysT5JTj7nFMCVBpPGwSTB+MqTNi0ro7xAQICYeCPrShFrrQ/HluPT5cY6NkRZ04PGiJ5
         dssZKA5Q6CtW3RHLuSonqbRCZvxNFjunN9xyubVZ9lydEPMavl860M75D/ehB+WY1Zn2
         yl+ix81NJIgzUWYcsIzHs1tHxXw+c7pExXfgjJDImCozQB9Rdz8cWUIkmJoQQH1PddCP
         i2peO4LclAcWs+nRhowDvQKx5xh6fL+82aQS/BKPUZ5GW95DmBjjs3SbsvSmGJuEaqGo
         8Wwg==
X-Forwarded-Encrypted: i=1; AJvYcCWYZM4wqigyPiM6S4yrgWOApJyv3cjQQDRHJEUu+O/ZUdy2qbvHeERLvW8fG4AUd9o8G4/Zyz06crA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylghVuRm5fEwjspEviqiek4DZ110YZ5pf92RA9LThUJ01pDTcJ
	Wsj3SFtyU4D5UQxGrlRMzw0Fp7Err30TFZkhqW4tqiSeMnhJIdshux8T
X-Gm-Gg: ASbGncu5ElOvF0uXty/PKY4Jas13D9JA8UvtQ2Sq7rIes7mvBPSaqVcmM4enAo0AvYl
	RIpzoZ3COGnE7cNwgLKlhRolJ0Lbh5yTlMXRos/FVEXF0mLoRtL62ShEjs8zRO0TxsWPO9E1Ep/
	KhLkSYf7btJ+ttztyxduo7EP/Ic8N0LvFLwDO1XTQm4uXCSwLhq4dWwF6VZjBmKPXC/2JwGtFNe
	WVVtT7US8Ci1Xl10iv05SKTIzwd2ebSCrlB2JU319eFCQ1Jf2MjGyrhxvcMFa3jkcgpmMX6It3/
	Mouj3LkXuIyc7U7tVxCpLHLOAjM4xblDmLhUwglKlPsPjoVXwTBRzcIxMfWr2fOSOAQhpjfaRo3
	waHF532P8cZXF6pxYAGZfY5x6A6q4tohccZCQCNP+yqeNJc1QgGwY6KjttPkaDr7JGh536yUbLo
	a8b0x/MA+bMPHTZA==
X-Google-Smtp-Source: AGHT+IFdXHddbS3YahClgjukUuSYo5q86nrHHLv0wekajQYQYjxd/clThSoKb648YqTTU/IIr/EKUA==
X-Received: by 2002:a05:6870:a2d1:b0:3e7:e20a:39fb with SMTP id 586e51a60fabf-3ed1fd4ff6cmr7103109fac.11.1764339661150;
        Fri, 28 Nov 2025 06:21:01 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:73::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f0dcfdb503sm1801960fac.14.2025.11.28.06.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 06:21:00 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 28 Nov 2025 06:20:49 -0800
Subject: [PATCH net-next 4/4] Documentation: netconsole: Document send_msg
 configfs attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-netconsole_send_msg-v1-4-8cca4bbce9bc@debian.org>
References: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
In-Reply-To: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, calvin@wbinvd.org, 
 kernel-team@meta.com
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352; i=leitao@debian.org;
 h=from:subject:message-id; bh=iAhkuxtvlLCx3FI2+LZ2MUKk3NrR4LQpjDFB2p7NYFA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpKa/F+n91KlfHmNbR3+aEeTppVS0z8VZzSPsvL
 P1xw6ToDciJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaSmvxQAKCRA1o5Of/Hh3
 bcv3D/9yfpizPhvw/0kpd6DLJkeflw/6EdTVIyepbmpLrnAtRfmN/B9x/C0ISfefQNwYnyMZpD1
 lVYSNjv1aZd4tOGqcUvqbY8OkLgsVVLXyuctR27pw8jNu0ObZhF0JddNKQJnHKbMKI2Pi5+pfs0
 iltAjWUMzmjMt5mULUZ40HQvla414ukJnTtD/E1RX3wVsiBU8m+lS7Dsg6ofTJxmkBC1vJGuW1a
 FwrluZ3UY798WrlEfNfL/nxdcy642+rC2jNF4miKMvKhfCCyFfCL2f3+k/lPSxkbIy/oz3w78mb
 SwJSZ9fDlplQdVC4Ylv6SrbCs5R5v0bNfbSsmOxw8OwjEx491JsX16KZqjLyRawLPARNjp4gCYg
 FZlvQYB6CV55OrPyAdO92VaS4DKKKkVzBTcvCdkpSvnKU/PyqHV0/iMnS/GuMtpKrWofbu+rlKo
 ZtBR1at+N7TAr6tqMPRBbV3MIwIZUmRfTmT9Uc2MuedAt1HYt/FpjEXJmX9rOd9ZLuJOSrkriXp
 b7APvJbpdLWfKX+W7JJIrkMvXVXZEdEefP06LX5SUv0toe78VqmzA7tiEMdEhdrodlP4l7Olh+p
 1wMYXVNHzfCtnU1P/naWOE1c22THeLc8VZgXimISheVMC9wFSgOc2EHkP93b4NmaJ5UdlRfgMdC
 IWK5SY9NbyV8cLw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

Add documentation for the new send_msg configfs attribute that allows
sending custom messages directly through netconsole targets.

The documentation covers:
- How to use the send_msg attribute
- Key features and requirements
- Use cases for direct message sending
- Example of periodic health check implementation

This feature enables userspace applications to inject custom messages
into the netconsole stream without going through the kernel's printk
infrastructure, which is useful for application monitoring, testing,
and debugging purposes.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Documentation/networking/netconsole.rst | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/Documentation/networking/netconsole.rst b/Documentation/networking/netconsole.rst
index 4ab5d7b05cf1..229d5fe9a3b3 100644
--- a/Documentation/networking/netconsole.rst
+++ b/Documentation/networking/netconsole.rst
@@ -139,6 +139,7 @@ The interface exposes these parameters of a netconsole target to userspace:
 	local_mac	Local interface's MAC address		(read-only)
 	remote_mac	Remote agent's MAC address		(read-write)
 	transmit_errors	Number of packet send errors		(read-only)
+	send_msg	Send custom messages directly		(write-only)
 	=============== =================================       ============
 
 The "enabled" attribute is also used to control whether the parameters of
@@ -158,6 +159,45 @@ You can also update the local interface dynamically. This is especially
 useful if you want to use interfaces that have newly come up (and may not
 have existed when netconsole was loaded / initialized).
 
+Direct Message Sending
+----------------------
+
+The `send_msg` attribute allows sending custom messages directly through a
+netconsole target without going through the kernel's printk infrastructure.
+This is a write-only attribute that can be used to send arbitrary text to
+the configured remote logging agent.
+
+To send a message directly::
+
+ echo "Custom status message" > /sys/kernel/config/netconsole/target1/send_msg
+
+Key features:
+
+* Messages can be sent only when the target is enabled
+* The network interface must be up and running
+* For extended targets, messages are sent with the extended header format
+* For non-extended targets, messages are fragmented if they exceed the
+  maximum chunk size
+* Messages bypass the kernel log buffer entirely
+
+This is useful for:
+
+* Sending application-level alerts or status updates
+* Injecting custom markers or delimiters into the log stream
+* Sending diagnostic information from userspace scripts
+* Testing netconsole connectivity without generating kernel messages
+
+Example use case - sending periodic health checks::
+
+ while true; do
+   echo "[$(date)] System health: OK" > /sys/kernel/config/netconsole/target1/send_msg
+   sleep 60
+ done
+
+.. note::
+   The `send_msg` attribute requires the target to be enabled. Unlike other
+   parameters, you do not need to disable the target to use this attribute.
+
 Netconsole targets defined at boot time (or module load time) with the
 `netconsole=` param are assigned the name `cmdline<index>`.  For example, the
 first target in the parameter is named `cmdline0`.  You can control and modify

-- 
2.47.3

