Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FED2DAFDE
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 05:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001348; cv=none; b=NG0wKhMmdQ6KU/Ys+8VGpPz737av6G2ybz4wucKVZEuohZdnE2mxtxPxI8UTn0qjAesynGh4/EMJAW7EMoAPWx0/sybd6w/kwU+l6iM8c4WJnpJ9O0i3IZPwY+xQyJZTLCbpZ1mqI6tLIK4NkClAoGvJNDBR2Cgsb0o3ZPsJ+iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001348; c=relaxed/simple;
	bh=s3GvmSoy5s2bHxCYgUEWv9aakkUAInGXHQTxN3diAb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvaWpMCwm8ClVWRe/QSOMoHiFAw70pqV0vmGRff022IONmGSr9421HQNu6v8iFGA3rYhw9eOkYqJSMn7+SKtPCScugSMy7jXb+tz4cpavFhkRFMO+5Oft8/Bka8xFe0AKcrTNNG8Z3aB9P81meQhH7uRx5/e5YgAvmLjsiL3kuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/dPGdW5; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/dPGdW5"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-323266d6f57so5749829a91.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 22:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001346; x=1758606146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqFW5edEm5BNR652JSYlQ4eaSBZxreKvI2dyuTcl96U=;
        b=P/dPGdW5xm1/Gb8Vw3npgW9y67/CdvNUHrVEOkBWIv7js0TUZUbwFvHiSZLcaL4Puq
         qmQlJsITumcyq4Rfa1cPNMGRtttwPVnxwbUWhipYWlzjoPlNbGa/qdaXI8JF9fTFrjTb
         b+0f1Q3nKhrbjl0dN/8ymU21o6/P1FniyL4EusNKj/KE1rfEJ8b2PYu0WJUPmHNgPpdx
         o+jW14VLvoisAPc9FEbB1JwhEZS6VEKA6pi0N3/ilt6YJpvX1matLV/ozTKBPPj+PDHD
         L38WVjnSiBaOdAop2iWlO7XDIyT6AeUhmiuR52wXm8bB4rYXh/jSA//ZtLp7/2gSN2/u
         QMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001346; x=1758606146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqFW5edEm5BNR652JSYlQ4eaSBZxreKvI2dyuTcl96U=;
        b=imOSPnVpfIlN6NID05IGaluMwq319Nj/xvWRXtN/irFjmDV1l1/xD1C1uH3oKHnbd0
         gK2iHK38Gv+9Z0JQKQFZ9VenYbr15xcMDWyKgj2dObZgEDgzG9cJZNrW+i5btvWwKrW3
         QHkRsvXcIxyHZxkHz4mN0dqqHND5+IGRE3sehIR8suLF2urlzar9fdDFyDacXf7bpLye
         Dj2EmaOFnzDC9NbDKD4l3keLm1/v2PJTUpv9Wh8ggsxWb6mxX0yYE0ms/KD+8R20Mer2
         ZlD5HfSTo+u884sufSypFLWgjRNeNXmzHmhsBcmlFd7ZPvbkzJwAZrOATM94UlEd8TWI
         P93g==
X-Forwarded-Encrypted: i=1; AJvYcCWc6KZ6IfAb0QQmMFUzy7FKF96bURllny3rBwY2jc5r/huqmdNGcWvZ+dOv+vr1PvgPxhEuasm26SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6Z44BsqExPg6LNskf61OrwpJqJ0CfIbqvcIQORywmPtPlog6
	t2sjxg/H2s0lJte4tski/eLmfVgm/PZGPgmZ6A+mDz2C/s6lRHZy8IDc
X-Gm-Gg: ASbGnctzG9rObG4gSUfwDMz0PXDnYHxZxlRjpmZ4JJk7eYH98TYcYklAh2ii+iiAYSo
	pRO9e8l/jTJLXRbdcLnHaVpvYYnmW6TXOJKKpKuqg+B+mTGlcdKlL8Nq3oqnZCxj4DvbkWT4WSI
	OHPHBWCQ72WgSqchsVl+vEix+oJ43TYE2O/vDDk4PGnIE35+Tz0m+QWJ9VDmBE2BpzImNRQM/nP
	JfDkLbXFhux0k1JZvgyXH+21Bv3qUGGw6zw4xef+IcnUeKP1VlNZ8GZmk4QS8+vlo6ARR4rt2UT
	6XtCfGOaQZAz2RgrjIhhcMUqbzZUMe6KnasqqizGAv+4i6KUu7DbyXy+/g76niF2pSXImYDkv6D
	fFQRmbl9e9tA37+s78Zzaut8mfH4XvUN7ugjm56/6UYs0
X-Google-Smtp-Source: AGHT+IF5SlzGBRZHF9Fg5+r/zQQ/zX3EeOfRCNVJSjf7e3asAYfXVYxsRAMsjecPeOX7V2iBLgIbtw==
X-Received: by 2002:a17:90b:5827:b0:32e:f22:3633 with SMTP id 98e67ed59e1d1-32e0f223732mr14377214a91.24.1758001345761;
        Mon, 15 Sep 2025 22:42:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea0f94005sm573088a91.1.2025.09.15.22.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:25 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 56A3E4227233; Tue, 16 Sep 2025 12:42:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tom Zanussi <zanussi@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 2/5] Documentation: trace: histogram-design: Trim trailing vertices in diagram explanation text
Date: Tue, 16 Sep 2025 12:42:00 +0700
Message-ID: <20250916054202.582074-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916054202.582074-2-bagasdotme@gmail.com>
References: <20250916054202.582074-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12121; i=bagasdotme@gmail.com; h=from:subject; bh=s3GvmSoy5s2bHxCYgUEWv9aakkUAInGXHQTxN3diAb4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBknfpgles41fncj+v7NZ2H1E/QMcyaLPOOWdWiw0VE/x tkkfbm1o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABP5ZsXw3/mv0XqFpYWa8QsW finRmnHo4S/TNaUPo0rjmP17L7Myv2dk2Jy61muy8T6Zgu2nY4Wt7rzUkg96fTHHz0B2R/irRW/ +MAAA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Diagram explanation text is supposed to be interleaved commentary
between diagram parts that are spread out, but it outputs ugly in
htmldocs due to trailing vertices as if both the explanation and the
diagram are in the same literal code block.

Trim trailing vertices.

Reviewed-by: Tom Zanussi <zanussi@kernel.org>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/trace/histogram-design.rst | 138 +++++++++++------------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index 5765eb3e9efa78..231a12bd7d461c 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -142,30 +142,30 @@ elements for a couple hypothetical keys and values.::
                              +--------------+                            |  |
                                             n_keys = n_fields - n_vals   |  |
 
-The hist_data n_vals and n_fields delineate the extent of the fields[]   |  |
-array and separate keys from values for the rest of the code.            |  |
+The hist_data n_vals and n_fields delineate the extent of the fields[]
+array and separate keys from values for the rest of the code.
 
-Below is a run-time representation of the tracing_map part of the        |  |
-histogram, with pointers from various parts of the fields[] array        |  |
-to corresponding parts of the tracing_map.                               |  |
+Below is a run-time representation of the tracing_map part of the
+histogram, with pointers from various parts of the fields[] array
+to corresponding parts of the tracing_map.
 
-The tracing_map consists of an array of tracing_map_entrys and a set     |  |
-of preallocated tracing_map_elts (abbreviated below as map_entry and     |  |
-map_elt).  The total number of map_entrys in the hist_data.map array =   |  |
-map->max_elts (actually map->map_size but only max_elts of those are     |  |
-used.  This is a property required by the map_insert() algorithm).       |  |
+The tracing_map consists of an array of tracing_map_entrys and a set
+of preallocated tracing_map_elts (abbreviated below as map_entry and
+map_elt).  The total number of map_entrys in the hist_data.map array =
+map->max_elts (actually map->map_size but only max_elts of those are
+used.  This is a property required by the map_insert() algorithm).
 
-If a map_entry is unused, meaning no key has yet hashed into it, its     |  |
-.key value is 0 and its .val pointer is NULL.  Once a map_entry has      |  |
-been claimed, the .key value contains the key's hash value and the       |  |
-.val member points to a map_elt containing the full key and an entry     |  |
-for each key or value in the map_elt.fields[] array.  There is an        |  |
-entry in the map_elt.fields[] array corresponding to each hist_field     |  |
-in the histogram, and this is where the continually aggregated sums      |  |
-corresponding to each histogram value are kept.                          |  |
+If a map_entry is unused, meaning no key has yet hashed into it, its
+.key value is 0 and its .val pointer is NULL.  Once a map_entry has
+been claimed, the .key value contains the key's hash value and the
+.val member points to a map_elt containing the full key and an entry
+for each key or value in the map_elt.fields[] array.  There is an
+entry in the map_elt.fields[] array corresponding to each hist_field
+in the histogram, and this is where the continually aggregated sums
+corresponding to each histogram value are kept.
 
-The diagram attempts to show the relationship between the                |  |
-hist_data.fields[] and the map_elt.fields[] with the links drawn         |  |
+The diagram attempts to show the relationship between the
+hist_data.fields[] and the map_elt.fields[] with the links drawn
 between diagrams::
 
   +-----------+		                                                 |  |
@@ -440,31 +440,31 @@ sched_waking histogram
                                              n_keys = n_fields - n_vals   | | |
                                                                           | | |
 
-This is very similar to the basic case.  In the above diagram, we can     | | |
-see a new .flags member has been added to the struct hist_field           | | |
-struct, and a new entry added to hist_data.fields representing the ts0    | | |
-variable.  For a normal val hist_field, .flags is just 0 (modulo          | | |
-modifier flags), but if the value is defined as a variable, the .flags    | | |
-contains a set FL_VAR bit.                                                | | |
+This is very similar to the basic case.  In the above diagram, we can
+see a new .flags member has been added to the struct hist_field
+struct, and a new entry added to hist_data.fields representing the ts0
+variable.  For a normal val hist_field, .flags is just 0 (modulo
+modifier flags), but if the value is defined as a variable, the .flags
+contains a set FL_VAR bit.
 
-As you can see, the ts0 entry's .var.idx member contains the index        | | |
-into the tracing_map_elts' .vars[] array containing variable values.      | | |
-This idx is used whenever the value of the variable is set or read.       | | |
-The map_elt.vars idx assigned to the given variable is assigned and       | | |
-saved in .var.idx by create_tracing_map_fields() after it calls           | | |
-tracing_map_add_var().                                                    | | |
+As you can see, the ts0 entry's .var.idx member contains the index
+into the tracing_map_elts' .vars[] array containing variable values.
+This idx is used whenever the value of the variable is set or read.
+The map_elt.vars idx assigned to the given variable is assigned and
+saved in .var.idx by create_tracing_map_fields() after it calls
+tracing_map_add_var().
 
-Below is a representation of the histogram at run-time, which             | | |
-populates the map, along with correspondence to the above hist_data and   | | |
-hist_field data structures.                                               | | |
+Below is a representation of the histogram at run-time, which
+populates the map, along with correspondence to the above hist_data and
+hist_field data structures.
 
-The diagram attempts to show the relationship between the                 | | |
-hist_data.fields[] and the map_elt.fields[] and map_elt.vars[] with       | | |
-the links drawn between diagrams.  For each of the map_elts, you can      | | |
-see that the .fields[] members point to the .sum or .offset of a key      | | |
-or val and the .vars[] members point to the value of a variable.  The     | | |
-arrows between the two diagrams show the linkages between those           | | |
-tracing_map members and the field definitions in the corresponding        | | |
+The diagram attempts to show the relationship between the
+hist_data.fields[] and the map_elt.fields[] and map_elt.vars[] with
+the links drawn between diagrams.  For each of the map_elts, you can
+see that the .fields[] members point to the .sum or .offset of a key
+or val and the .vars[] members point to the value of a variable.  The
+arrows between the two diagrams show the linkages between those
+tracing_map members and the field definitions in the corresponding
 hist_data fields[] members.::
 
   +-----------+		                                                  | | |
@@ -565,40 +565,40 @@ hist_data fields[] members.::
                                                       |               |     | |
                                                       +---------------+     | |
 
-For each used map entry, there's a map_elt pointing to an array of          | |
-.vars containing the current value of the variables associated with         | |
-that histogram entry.  So in the above, the timestamp associated with       | |
-pid 999 is 113345679876, and the timestamp variable in the same             | |
-.var.idx for pid 4444 is 213499240729.                                      | |
+For each used map entry, there's a map_elt pointing to an array of
+.vars containing the current value of the variables associated with
+that histogram entry.  So in the above, the timestamp associated with
+pid 999 is 113345679876, and the timestamp variable in the same
+.var.idx for pid 4444 is 213499240729.
 
-sched_switch histogram                                                      | |
-----------------------                                                      | |
+sched_switch histogram
+----------------------
 
-The sched_switch histogram paired with the above sched_waking               | |
-histogram is shown below.  The most important aspect of the                 | |
-sched_switch histogram is that it references a variable on the              | |
-sched_waking histogram above.                                               | |
+The sched_switch histogram paired with the above sched_waking
+histogram is shown below.  The most important aspect of the
+sched_switch histogram is that it references a variable on the
+sched_waking histogram above.
 
-The histogram diagram is very similar to the others so far displayed,       | |
-but it adds variable references.  You can see the normal hitcount and       | |
-key fields along with a new wakeup_lat variable implemented in the          | |
-same way as the sched_waking ts0 variable, but in addition there's an       | |
-entry with the new FL_VAR_REF (short for HIST_FIELD_FL_VAR_REF) flag.       | |
+The histogram diagram is very similar to the others so far displayed,
+but it adds variable references.  You can see the normal hitcount and
+key fields along with a new wakeup_lat variable implemented in the
+same way as the sched_waking ts0 variable, but in addition there's an
+entry with the new FL_VAR_REF (short for HIST_FIELD_FL_VAR_REF) flag.
 
-Associated with the new var ref field are a couple of new hist_field        | |
-members, var.hist_data and var_ref_idx.  For a variable reference, the      | |
-var.hist_data goes with the var.idx, which together uniquely identify       | |
-a particular variable on a particular histogram.  The var_ref_idx is        | |
-just the index into the var_ref_vals[] array that caches the values of      | |
-each variable whenever a hist trigger is updated.  Those resulting          | |
-values are then finally accessed by other code such as trace action         | |
-code that uses the var_ref_idx values to assign param values.               | |
+Associated with the new var ref field are a couple of new hist_field
+members, var.hist_data and var_ref_idx.  For a variable reference, the
+var.hist_data goes with the var.idx, which together uniquely identify
+a particular variable on a particular histogram.  The var_ref_idx is
+just the index into the var_ref_vals[] array that caches the values of
+each variable whenever a hist trigger is updated.  Those resulting
+values are then finally accessed by other code such as trace action
+code that uses the var_ref_idx values to assign param values.
 
-The diagram below describes the situation for the sched_switch              | |
+The diagram below describes the situation for the sched_switch
 histogram referred to before::
 
-  # echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0' >>     | |
-          events/sched/sched_switch/trigger                                 | |
+  # echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0' >>
+          events/sched/sched_switch/trigger
                                                                             | |
   +------------------+                                                      | |
   | hist_data        |                                                      | |
-- 
An old man doll... just what I always wanted! - Clara

