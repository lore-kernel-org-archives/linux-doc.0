Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEA8274B3C
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 16:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186780; cv=none; b=PT9Ged1zDZEp41lrRsnRea2mMG7LEXmvMeg1hFTnXwusdL0vdqm9X0Z1B4ETDGGaW8e3DU3LinfurBbmnqWnF5m/scM6FeCHmVgxSfledjwsIsiOuxtGz/VCsoO6HR3wStbEqBjbqcDzy7TSqWeQzrdZdTJW6ey3fqrPFLRumK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186780; c=relaxed/simple;
	bh=SA8YBwX6UV/exj69CxLhHvYltiFC6wLWEhuIydTpxus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XpjnAPm2mB1bnU5qgt1LgHnmGqCcf7FRRFcCRLldxPJvZJ113UYyVxF+xwHTVscZ1cyN0fJ5YntcfCiTo0rRWH8snhX0jTf40N4SLrCXxi0CXkfhhluVYC0XusYe29fX1AzQp/Hf2m8DIenQb5wEvcH3NcE9DuY849RS6UCjRzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DW2D3EZL; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW2D3EZL"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-795be3a3644so29715566d6.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 08:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762186777; x=1762791577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ncd8iftKarOftKagzkM1Xq0zcBakpgViOG8SqvFntD8=;
        b=DW2D3EZLMhCYEg7/WUS5CDUC8gjTNM77YeaSHNPHUGPmxLJ98Q0DFehyVSoO3JivoN
         k0FlfzsySn9uA6UBAmIz7qyz36z1xm94/1AswpDGs42TuGUegAQ9BEI1imKM94qQ4L6x
         zvsuXPMS3ICQR5zuYTxwWcfgoA0RT8JjkedoGFY7RH3tjVgmmlWPisRWKr1ofVHbI77g
         qYdTQSlcAd4ZGqJU/LnP1rVbSe2Bgv6TUxUAeLqIWmFhF5RBiLqgOUw4uazwICjAWERq
         17n/rS2C628cz1fr1vBKUat4a/Z91YugnM1twYt/rCfeX3Shm8Ee0VwSw/E0CP0nq17M
         +QrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186777; x=1762791577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ncd8iftKarOftKagzkM1Xq0zcBakpgViOG8SqvFntD8=;
        b=RE14QOE+XnAyZfU4WTDvad+NhpxGGZnzNx1ZIfnxVMLLOEL3JIhrH9HlqQpklOW6Lm
         r6gM4im+5ev8apmGoK68xQB+JAza6NVhbeeZWfR7RLWTEY4eZL+eiVWDNXyEpJRJTqWE
         9N1/0bTdfQAk8HuUi2XksplvTNR1iROajDD6EUJETDZpys9BqPi+D/3LhQb7DvicoN8b
         hxrRvqeXXw7Z2vEtSC1sjPGEve+qA5Pec6WWkeSdTvscxvFnj3/BuIgUKAUb3+IWMkqM
         ft9T6J1FKb+SyuywTr//dkg0KbWzXAO3glWpCAGPwjR6xVUnp4YeuW3cOsc1qOdWqJEy
         NFYg==
X-Forwarded-Encrypted: i=1; AJvYcCUL1lnLtTmNM+D3FRLfsDUvklQexMcI6QJ4JxaQuJLn/TBOR9++R/TEuiVecyLSFi5gl9u+zvj6igQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKcwODP7JSr7DGKf29v4T50JWPDf8P9OAlUEm15XSYPpZin+W7
	oUf0/qlgxEq1RoNA32wa77ks/SARmicVAHTuvpbNjkL1hATNfC7iyo4p
X-Gm-Gg: ASbGnctXTKQ+uGfTwr+nI5dRJcAQLMGciAVuHXtw7rdhICzWihhJ3qOj9kfZy8ZhVWl
	ipumB8/qYVD3+7KqiXVv/UkrLNQrbU2SQCPZpp4Y224ztMtsIU1K/qm7TuTCTywoVS4cuatfFyB
	FzYyhbbDONtPL1Xla1v6E0WW6H0J54vxYzrwyOEA/h4zLf3Hs2zWNBID2ZB4KPHF57ERXe9nT9T
	cdgv8RXGHG2j7dlh1Ywolkrbn/Sq5Y4ZnpX0qcCMZ64wOx7YYQf+soki5xFluAZQ1U34OupSH65
	vG/nIbGUU82C8SYUjhfdNz0HH0m5Od4k4vqxz356PnAgFAqzp6QgvjAlU529/mOr3eN6yMei/1w
	5CpNFpVSsGURGLpe6qeDq23ej6eYo6RgDSDFe340CNM/GqeEbkFnQyqCLjfkUKgPUtVG0dMzsui
	ESj1ILwy7UBQPbw6g=
X-Google-Smtp-Source: AGHT+IEAQfamPC/d0ofEW4bGHVEQ9HHMtZbp4Q8HmqPZCWRtg8LnyQJ/AkABfg86VcVL9UWlrv5V2w==
X-Received: by 2002:a05:6214:f01:b0:785:aa57:b5bb with SMTP id 6a1803df08f44-8802f44b4b4mr155355746d6.43.1762186777421;
        Mon, 03 Nov 2025 08:19:37 -0800 (PST)
Received: from ideapad.tufts.edu ([130.64.64.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060eb3332sm4273556d6.60.2025.11.03.08.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 08:19:37 -0800 (PST)
From: Ivan Pravdin <ipravdin.official@gmail.com>
To: rostedt@goodmis.org,
	tglozar@redhat.com,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ivan Pravdin <ipravdin.official@gmail.com>
Subject: [PATCH v5 0/2] rtla: fix cgroup and trace options parsing
Date: Mon,  3 Nov 2025 11:19:04 -0500
Message-ID: <cover.1762186418.git.ipravdin.official@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes 2 issue in rtla timerlat and osnoise parsing.

1. Make -C/--cgroup option more user-friendly. Currently rtla timerlat
   and osnoise parses does not allow to specify tracer's threads cgroup
   name as `-C [cgroup]` or `--cgroup [cgroup]`. Second patch fixes this
   by allowing users to specify cgroup in the aforementioned manner.

2. When specifying `-t/--trace` before `-a/--auto`, trace filename is
   override to default <osnoise|timerlat>_trace.txt. For example, when
   running rtla as

       `rtla timerlat top -t custom_file.txt -a 100`

   when the threshold is reached, timerlat_trace.txt file is created
   instead of specified custom_file.txt. Third patch addresses this
   issue.
   
changes v4 -> v5:
   - Removed setting trace_output before checking if it's NULL in
     `fix -a overriding -t argument` patch

changes v3 -> v4:
   - Removed patch [1] as it has been mainlined
   - Resolved merge conflicts with [2]

changes v2 -> v3:
   - Combined common logic into a utility function to parse optional
     argument value
   - Removed change that removed `clear_terminal` 

changes v1 -> v2:
   - Moved removing clear_terminal from `fix -C/--cgroup interface`
     patch to `fix -a overriding -t argument` patch
   - Added clarification why to remove clear_terminal
   - Added `Fixes:` tag to the `fix -C/--cgroup interface` patch

v4: https://lore.kernel.org/all/cover.1760791697.git.ipravdin.official@gmail.com/
v3: https://lore.kernel.org/all/cover.1757034919.git.ipravdin.official@gmail.com/
v2: https://lore.kernel.org/all/cover.1755018581.git.ipravdin.official@gmail.com/
v1: https://lore.kernel.org/all/cover.1755014784.git.ipravdin.official@gmail.com/

[1] https://lore.kernel.org/all/164ffc2ec8edacaf1295789dad82a07817b6263d.1757034919.git.ipravdin.official@gmail.com/
[2] https://patchwork.kernel.org/project/linux-trace-kernel/list/?series=999703

Ivan Pravdin (2):
  rtla: fix -C/--cgroup interface
  rtla: fix -a overriding -t argument

 Documentation/tools/rtla/common_options.rst |  2 +-
 tools/tracing/rtla/src/osnoise_hist.c       | 29 +++++++--------------
 tools/tracing/rtla/src/osnoise_top.c        | 29 +++++++--------------
 tools/tracing/rtla/src/timerlat_hist.c      | 29 +++++++--------------
 tools/tracing/rtla/src/timerlat_top.c       | 29 +++++++--------------
 tools/tracing/rtla/src/utils.c              | 26 ++++++++++++++++++
 tools/tracing/rtla/src/utils.h              |  1 +
 7 files changed, 64 insertions(+), 81 deletions(-)

-- 
2.48.1

