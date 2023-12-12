Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIAnK4rf"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB3AAC;
	Tue, 12 Dec 2023 14:16:44 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-33635163fe6so779105f8f.3;
        Tue, 12 Dec 2023 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702419402; x=1703024202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uj94wzE87RLEym7VefjYamBPKqN2ktHl1CeOxhfULeA=;
        b=RIAnK4rfHSHf39L5mY3QiKQ/Km8rhDduTTwC5AnBKTIRL51hv298EeiQNGRb/k7zKX
         sz3uRmgPF2oezOsDnNzTCYkR/SmiJSsse2Wz+2LmcB0NIKNp9qTAw1t//L7aPdX+IAHx
         2a3kjyv9BO8WV/3tD/EmBd3X8nJGgZItGKNa31O5LmWc4Wiac/aSnColRV1NMnQUdXYH
         WZ3MJNVi9iktWzyEk7OoFvfShU2pXWBbziOVM5e6iMGbDYoJoTBPhmhV3jB+OCWdLyzP
         WJvul+qcgLPLPWv+bdQM0RX34X5XSVuVUuSNBBL5ynRl67dYF3iitazSWD/vJo750nmz
         r1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702419402; x=1703024202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uj94wzE87RLEym7VefjYamBPKqN2ktHl1CeOxhfULeA=;
        b=Bd5AXNQ6itHcXUNIjtrQLhFsj/eru7ODh+lk6QGCr8PnLkYjtRTa2yv77I9nb12VVx
         xr8bd5L+f4E9d+V5nZ6w1uvHwXjGdQHjMiks9G+5K1a6xLrXu/N8zAtGIPEgEyZOzjUx
         RKlxqb6BulvPWBMuoSMVUIBxA4E/fPIeJygEWV/4EkZVZdHiYLpz58oAWuljKvHmBQBi
         k8fDzOns0lKRetFs9ltXPb+DzfAcu0o3OlMOnlprABtnWV9s7d6uRjNkAg2V56i2VVWh
         cOrDOqfyRJn6FsklWkFqkIV6YmYNeLeXpUG1lZys5VQ2QkLKryI3V3MNHrcNUfYlAeFm
         fChQ==
X-Gm-Message-State: AOJu0YyYrOS4R5up6GFW4MIsd72wt+o0kaMj3LyBmaoL2NuJwbuNNdde
	IDXCLZMftysHxYgKLW1btAgb6aesADG8og==
X-Google-Smtp-Source: AGHT+IFrmslEBYEhpteVSjgjDpdRw51/MzWMyCZcQNv7Y0S3Up4i9xhMofkmyM7aFlXnGCk7bW2hKg==
X-Received: by 2002:adf:e712:0:b0:336:30b5:3c19 with SMTP id c18-20020adfe712000000b0033630b53c19mr873125wrm.126.1702419402607;
        Tue, 12 Dec 2023 14:16:42 -0800 (PST)
Received: from imac.fritz.box ([2a02:8010:60a0:0:a1a0:2c27:44f7:b972])
        by smtp.gmail.com with ESMTPSA id a18-20020a5d5092000000b00333415503a7sm11680482wrt.22.2023.12.12.14.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:16:41 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Breno Leitao <leitao@debian.org>
Cc: donald.hunter@redhat.com,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH net-next v3 11/13] tools/net/ynl-gen-rst: Sort the index of generated netlink specs
Date: Tue, 12 Dec 2023 22:15:50 +0000
Message-ID: <20231212221552.3622-12-donald.hunter@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231212221552.3622-1-donald.hunter@gmail.com>
References: <20231212221552.3622-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The index of netlink specs was being generated unsorted. Sort the output
before generating the index entries.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 tools/net/ynl/ynl-gen-rst.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/net/ynl/ynl-gen-rst.py b/tools/net/ynl/ynl-gen-rst.py
index 19e5b34554a1..6b7afaa56e22 100755
--- a/tools/net/ynl/ynl-gen-rst.py
+++ b/tools/net/ynl/ynl-gen-rst.py
@@ -377,7 +377,7 @@ def generate_main_index_rst(output: str) -> None:
 
     index_dir = os.path.dirname(output)
     logging.debug("Looking for .rst files in %s", index_dir)
-    for filename in os.listdir(index_dir):
+    for filename in sorted(os.listdir(index_dir)):
         if not filename.endswith(".rst") or filename == "index.rst":
             continue
         lines.append(f"   {filename.replace('.rst', '')}\n")
-- 
2.42.0

