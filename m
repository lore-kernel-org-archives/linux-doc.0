Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75408244671
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764339658; cv=none; b=UC6RChZxjJcP1QquPMX8iU8FQETy65cA6Wu2Jvc64PCSFS4PhWOZNiVsUzxistoOFFLJPhjfdbaR+S+rJyf58Q3uQwI0tHoVzLHmlH8i4BJOkSwFNeXl9RqPFECOL6XIF5DjKM4tr+aeLVA71AMwieVyO6ySXIr8uUmc0ucJcGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764339658; c=relaxed/simple;
	bh=dlYzWgdKJezE3ECdVRuaFQ4lSQ2fO+F5ZxnSjSVmSQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LLOz+z5coNyumK3oapu1rjf/jyzAxMZV0odfpLry3iJdcZkEy+/XWlh5bNNBL9Kqr+qFawez6hDBn6EngpH9M6j5SgLY9Sv6wQuSUnWnLW4YclfH/ThYG+wjueb8WvrAOxSAuTWnJOF/JxdrUosI4of3v1ZIZIA83WjtrNpXOfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c76d855ddbso310679a34.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 06:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764339655; x=1764944455;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrbGLMdK80DjaisbPeaWQi49eJZoN/NohgD7YPqnYL4=;
        b=wN+6TdYvQ1wvLdYSrWcVjNKsGNoYapzOHhcXa99c8ANIxNaDj+Rc5ua9DcIDhiyWki
         7L6DhT2JbfIbGNmRRD70TyhW29bLpZbQL3o4uF2MHcCl1EOY3viS0X5zwGeovVxPKeMT
         J/MvQcI+/tRktFsJmrL3nCEIQAFO31DLQ9fbGPi1zc12/QilXLZiEh7i6HdRztbOOhIn
         Xc48WoiPUu6VjO2j9QBtqjPj8EH8MjefKMT7jaTCWcOOyDk8c8gkLg9vqEuZkQCsmpmg
         au/J1fFR8OOukaUA2IVE/9KTzk/IpKL5ZfEtaseZ7uqZ/5XVGm2gfzuvoLqzPb/pIKHR
         I35g==
X-Forwarded-Encrypted: i=1; AJvYcCU7wl16OyRmRPi+Lzw/CgusQQL9jWmTOL3PQQsPvfYsE9DPZQ8YOkSE4sckHqv3OoBgas/kVKtvcgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5DOyNSug5DPLgq3qxHyXF8yrB9yt/+bTDQBY5expChDkTYgR
	ZF4CjqSDCyrTI1qmwtQwZyejghXHti+whno313VaHyZ8s2iUj2BiUpYh
X-Gm-Gg: ASbGncsgQcqGe0YthzI8+nI2JN7L1UFh22QaczRjPiLGNT4yVQc2WHGwWrv1XFcq1WO
	GdfvCbGPQg+TMRp+muP3updJlNdukCYg+WxRn1TrH8G/5II7HSuZagoWJCYIntF8YKkDOifshdR
	II8uZVu92MRzi0ZTbYEGiCTW7vCEe2SC5uH6fdUmYyUuqNvvsEe5Z7QPlRJbrr9T8dAt8dxh1Of
	0nvrPbsAUYCZxaxuARLp83yDW15PaR25/Fsfb1WsUO1Q1XUoqINunXZK0O/PXY6ubGPy2/K2AdB
	H/1nHoyjDs9Wppi7LN8dDpy6vPy063Z7gjyfdNYMmno98+fIFv1XDDdq387r0NNXjJoE1qgQMSZ
	5hF0CGREwgu4qnIWlM0Rtmx+swTRjjC+UhE2sG5Q00/X/gVBBsYRJCwh5EBfnUHcCuwB04Nuwxc
	Wshp8C6WmsVAJt9A==
X-Google-Smtp-Source: AGHT+IEukTJJoSoCJBYd7Ajt13DEto12fjYWxAVqOZ1Kr7K6BN3PDrZk1Z2lUPjn1deToE63cQFX7w==
X-Received: by 2002:a05:6830:848d:b0:7c5:3c7d:7e65 with SMTP id 46e09a7af769-7c798fadaabmr12298319a34.16.1764339655389;
        Fri, 28 Nov 2025 06:20:55 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:72::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c90fe0f650sm1584491a34.23.2025.11.28.06.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 06:20:54 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next 0/4] (no cover subject)
Date: Fri, 28 Nov 2025 06:20:45 -0800
Message-Id: <20251128-netconsole_send_msg-v1-0-8cca4bbce9bc@debian.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2vKWkC/x3MYQqDMAwG0KuE77eFtaLTXmUMGW3mAls6mjIE8
 e4D3wHeDuMqbIi0o/JPTIoiku8I6fXQlZ1kREK4hMH7cHXKLRW18ubFWPPysdVN8+T7eRhzCj0
 6wrfyU7ZzvUG5OeWt4X4cfy9MjVJvAAAA
X-Change-ID: 20251127-netconsole_send_msg-89813956dc23
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, calvin@wbinvd.org, 
 kernel-team@meta.com, Petr Mladek <pmladek@suse.com>
X-Mailer: b4 0.15-dev-a6db3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=leitao@debian.org;
 h=from:subject:message-id; bh=dlYzWgdKJezE3ECdVRuaFQ4lSQ2fO+F5ZxnSjSVmSQY=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpKa/FRtTjWQbN4ZRH8XIGVZNJGjrhySQJN+Bd4
 iKJpTr2BYGJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaSmvxQAKCRA1o5Of/Hh3
 bZVWD/4lsRjAv6/OKe7Pq8tqjztfFUWCRfhj74SofeyX7dFqSIJ18/CVzl5tZb+rAGAdYFWWa1U
 h4p4Jpd0L6/rRuoQOyvl8y7UnaIcjp3N7LF/ndDQSnfPKR7ebW1ngt8mzGif9GLByLKWNqY0MWc
 xtq3hfp35W5Y3f41XyGqX3npzh+LBUxWsCj7fT8h/YlnDPU1xPUYbh0qgYpE222DCP7NbTe8KT0
 x8+v2GsldnJkdANyrhbNyflGGp8NWXx6veQUkBpirafxXIZpFqy2aOYHckVv6mqJu7Q1rKejvE3
 xTNKiq4xPX7ym2tc1RWEWkQ3qRe4jcIbHkVi4ZeqZK9kaRaXeBcesr09yIrAb0dxQv/AUJj/Vm9
 YOzeumVETujkqCFR34G38PlhB0Amk2oi5gsFEOzKLWfg0cAmhLTBPXZa9PoxkALHRV8BtUzfU4/
 4hZLdPXHA+MBmEL4zFIZ/ABrk8r4HSgEZPiJXfZXea2scpHUQeqtP3LdV8R3MUiogOvG6dpVi/O
 QOmYeZP8VBGgUqUOpYlkz08tK2r5Z73A6nZqujsrFzbex/fM8ZpY4vgBM/F9MaxaOKmtG8fepu6
 ibsjeneE8aso75R4Lu4w6G8b084ssSjIhzhMk3EC3+UQbRX021cMFZ8Hhl4SFaPgP06+/J9Y/iE
 mWQ27034Naq4z5Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D

This patch series introduces a new configfs attribute that enables sending
messages directly through netconsole without going through the kernel's logging
infrastructure.

This feature allows users to send custom messages, alerts, or status updates
directly to netconsole receivers by writing to
/sys/kernel/config/netconsole/<target>/send_msg, without poluting kernel
buffers, and sending msgs to the serial, which could be slow.

At Meta this is currently used in two cases right now (through printk by
now):

  a) When a new workload enters or leave the machine.
  b) From time to time, as a "ping" to make sure the netconsole/machine
  is alive.

The implementation reuses the existing message transmission functions
(send_msg_udp() and send_ext_msg_udp()) to handle both basic and extended
message formats.

Regarding code organization, this version uses forward declarations for
send_msg_udp() and send_ext_msg_udp() functions rather than relocating them
within the file. While forward declarations do add a small amount of
redundancy, they avoid the larger churn that would result from moving entire
function definitions.

---
Breno Leitao (4):
      netconsole: extract message fragmentation into send_msg_udp()
      netconsole: Add configfs attribute for direct message sending
      selftests/netconsole: Switch to configfs send_msg interface
      Documentation: netconsole: Document send_msg configfs attribute

 Documentation/networking/netconsole.rst            | 40 +++++++++++++++
 drivers/net/netconsole.c                           | 59 ++++++++++++++++++----
 .../selftests/drivers/net/netcons_sysdata.sh       |  2 +-
 3 files changed, 91 insertions(+), 10 deletions(-)
---
base-commit: ab084f0b8d6d2ee4b1c6a28f39a2a7430bdfa7f0
change-id: 20251127-netconsole_send_msg-89813956dc23

Best regards,
--  
Breno Leitao <leitao@debian.org>

