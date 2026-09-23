Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042ED3612E2
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 01:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790127269; cv=none; b=JlZfLc4PUQ07lAnl+YqNx+D4kHXKAlOdQN920PE1XU5pZj5hWgw8ZEtLy3ZSCJSmohn7FX+WHym1dhQc1BYA4DLus5I1SPnapxDxXWzAO84q+O0zgpKyXhBl/Y73huiOuh2acqpCPM0pForuLo5S0Ujk1INVNVc9M03QAXkh3KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790127269; c=relaxed/simple;
	bh=iU2FuQNmEXQCPbvdO6PlHEX1diONiNT34AcuPNd2qjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bk98LfYyOC6VckQUe9PmuZw9quFN+4tZ23Qrj5asPgPspz0qTeyjGksOPE8PBhMLievlCfcWCDFf87+977CciVnQelw5bwEJHnCh0/qXaiomeYRAdHQOczCVvnMeBHWYElETyNqWZkFtvb1g/oGM+PJ49CoizxtuzrXnDNhFwBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QByuSs0N; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QByuSs0N"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-328664c1479so244859eec.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 18:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790127266; x=1790732066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z425s6s/R/+sgdabTRg+eLb5zfe4+RFtNm44lmjghrE=;
        b=QByuSs0NhvzHWfBVNF8y+JnkxS3sY6M0+ui4WBxikrxr6OwsRY9CXl60GCkwpI4L9p
         HIXKntmIsf4VRiwisl9mGOQEF+KqPvJCVaz8ulFTIApu5XpaSKlIPuRyYoACIm2sQ+l+
         6FxG14OsFdawRQ5PX9XxTqCsWdT9v4lbkvjaTiIhgxSbtZh2BDSr0swHl7HsxWUZloT/
         EHvijuDrJuRuQTOTkAx6vwTxRC0D3yDmemTgGy8dO0nin/VJ5o4Hy5Qttyr5C+V6/30J
         QDDf0iT5Fs3dueSXrB0vlvb+QgaO0RZiIC2D5Q9TJxi1aaQrg5RV7w3cSNZdcI7E1/PC
         x1Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790127266; x=1790732066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z425s6s/R/+sgdabTRg+eLb5zfe4+RFtNm44lmjghrE=;
        b=K/GOWk4udFb26nq5cWzy6dIn4qt69WgTqizLyqOP4dGRI0LO7iqL6Xu/W9hrcxlO3l
         5q4vkXe9Lt/pYwe3dIALVzo27ciCgmCe0HwzmJn/tF8mKTocBvpTTnA0xADGEx/C0bX5
         TlPoPIGD4A73T7Hq7igqdMAVmEVraN5kULHK6x/aBwB+gK3JAxh/JwsU3EjkqB414cZr
         3wPTZ1Hs/BAvsFRoubhjOTZIoXVigaHQplr+yjbOuE95ms+4F5ffwksanBkiVjy5bXIs
         NzCbysZ78jMwUzwEBgdo7lJPN2k8T7iopUpt51+I8ZahVJYLxvWIp5NwXhS7kHqi6g9Y
         7YCw==
X-Forwarded-Encrypted: i=1; AKwUvBxoUs0YyxykX4wafI5WGeTejIUEcSzO2YW7oncqrupukXWwGrLPEYJIujX1xXGQJ0xMZ7L0W7N5+CM=@vger.kernel.org
X-Gm-Message-State: AFuF++nhPqQ1A0B2LuElThjTLJwbtY+5LW+NGMU1yT04XwK7qACMEERB
	Axk3kPRZSiY62BqHyBz4UUAwFkokmN2wILInyFEp6e5dbF1oSLzm/xSz
X-Gm-Gg: AYBFou01T77TDAC4r/WV11pQeEHWnnspaW+WJJKTC+frz/yaCuU2JWoAxABRR4oTnbW
	IHheLEOXYXIp4PwBHb+AB/ZXdMBYJP1TB2c0n2TUdHthxbnHIzcLaeFu2vN2QcqS7uVvTfQ5eFn
	BPnAZUXhWfTZV7NpaX3Xm67yE2UfS1esfUOGZesAiowrob9n7lBQKfUSnGaf4ngz1wrgoyh5bYR
	mL5oVZ2qW1GoWqQFP2OuTEtvQJGdPytl04hotui8Z+v9MDBFpvADDAn/JSi9sBWKEgQreiEdrxv
	qFsn5VLatAis59dNwrNsaNgW2U9IfW0Yr7CiTESrVXo6gvhO6m5LtutPP1oE/JxTlMXX6clOWsN
	hPVNjz2vs36r+rQN4TBuzKDyUJQLIo45AXDeDZLvaQCfOkhNc7gKNB7EZpfzXSCoZ99s0k9HVMZ
	U+kxuWdl9vQCk9vABci2dxXGDT76WI5hikFtYLUTKimW0dMOUH4RLAPddTNU/454vFcMQj1NroF
	E9cWPM/jf2MO5J1UB6rxOhT7BaKKoJoYmt5ON5DvK/mqHaMwHJXB48TBcNsKU+rbpwC353qVg18
	6XjDNlRWvmJwiqYk8HejVTgv77jkMBE=
X-Received: by 2002:a05:693c:8804:20b0:33c:2308:c0af with SMTP id 5a478bee46e88-33e8c05dccfmr1090276eec.17.1790127265904;
        Tue, 22 Sep 2026 18:34:25 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm2013520eec.28.2026.09.22.18.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:34:25 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 2/2] selftests: net: test untracked NA recovery of FAILED neighbors
Date: Wed, 23 Sep 2026 01:34:19 +0000
Message-ID: <ce40008682ed26ab039168a5fcb515eff8d30c3a.1790127207.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790127207.git.lfqlee314@gmail.com>
References: <cover.1790127207.git.lfqlee314@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Seed a FAILED neighbor before triggering an unsolicited NA. Verify that
the entry transitions to STALE and learns the advertised link-layer
address only when drop_unsolicited_na is disabled, accept_untracked_na
mode 1 or in-prefix mode 2 is enabled, and IPv6 forwarding is enabled.
Verify that disabling each gate keeps the entry in FAILED without a
link-layer address.

Mark the seed externally learned and disable carrier-based eviction so
the entry cannot be garbage-collected before the NA arrives. Require the
marker after processing to prove that a recovered entry was updated in
place instead of deleted and recreated.

Keep the NA source, target, and neighbor key fixed for the mode 2 cases.
Vary the prefix configured on the router to exercise the source-prefix
check without changing the entry under test.

Arm packet capture before bringing up the host interface and starting
DAD. Wait for the capture to become ready and for tcpdump to exit so the
NA cannot be missed and receive processing is complete before checking
the neighbor entry.

Preserve the return code from test_unsolicited_na_common() before
constructing the test description. The array assignment previously reset
the return code to zero and caused existing cases to report false success.

Fixes: f9a2fb73318e ("net/ipv6: Introduce accept_unsolicited_na knob to implement router-side changes for RFC9131")
Link: https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com
Assisted-by: LLM Sashiko sparse
Signed-off-by: Lawrence Lee <lfqlee314@gmail.com>
---
 .../net/ndisc_unsolicited_na_test.sh          | 195 ++++++++++++++----
 1 file changed, 160 insertions(+), 35 deletions(-)

diff --git a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
index 5db69dad0cfc..ba9e670b5149 100755
--- a/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
+++ b/tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
@@ -3,12 +3,18 @@
 
 # This test is for the accept_untracked_na feature to
 # enable RFC9131 behaviour. The following is the test-matrix.
-# drop   accept  fwding                   behaviour
-# ----   ------  ------  ----------------------------------------------
-#    1        X       X  Don't update NC
-#    0        0       X  Don't update NC
-#    0        1       0  Don't update NC
-#    0        1       1  Add a STALE NC entry
+# state   drop   accept  fwding                   behaviour
+# ------  ----   ------  ------  ----------------------------------------------
+# absent     1        X       X  Don't update NC
+# absent     0        0       X  Don't update NC
+# absent     0        1       0  Don't update NC
+# absent     0        1       1  Add a STALE NC entry
+# failed     1        X       X  Keep the NC entry in FAILED state
+# failed     0        0       X  Keep the NC entry in FAILED state
+# failed     0        1       0  Keep the NC entry in FAILED state
+# failed     0        1       1  Update the NC entry to STALE
+# failed     0        2       1  Update the NC entry to STALE if in-network
+# failed     0        2       1  Keep the NC entry FAILED if out-of-network
 
 source lib.sh
 ret=0
@@ -19,14 +25,18 @@ PAUSE=no
 HOST_INTF="veth-host"
 ROUTER_INTF="veth-router"
 
-ROUTER_ADDR="2000:20::1"
+ROUTER_ADDR_IN_NETWORK="2000:20::1"
+ROUTER_ADDR_OUT_OF_NETWORK="2000:21::1"
+ROUTER_ADDR="${ROUTER_ADDR_IN_NETWORK}"
 HOST_ADDR="2000:20::2"
+HOST_LLADDR="02:00:00:00:00:02"
 SUBNET_WIDTH=64
 ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
 HOST_ADDR_WITH_MASK="${HOST_ADDR}/${SUBNET_WIDTH}"
 
 tcpdump_stdout=
 tcpdump_stderr=
+tcpdump_pid=
 
 log_test()
 {
@@ -75,6 +85,7 @@ setup()
 
 	${IP_ROUTER} link add ${ROUTER_INTF} type veth \
                 peer name ${HOST_INTF} netns ${HOST_NS}
+	${IP_HOST} link set dev "${HOST_INTF}" address "${HOST_LLADDR}"
 
 	# Enable IPv6 on both router and host, and configure static addresses.
 	# The router here is the DUT
@@ -88,6 +99,8 @@ setup()
                 ${ROUTER_CONF}.drop_unsolicited_na=${drop_unsolicited_na}
 	${IP_ROUTER_EXEC} sysctl -qw \
                 ${ROUTER_CONF}.accept_untracked_na=${accept_untracked_na}
+	${IP_ROUTER_EXEC} sysctl -qw \
+                ${ROUTER_CONF}.ndisc_evict_nocarrier=0
 	${IP_ROUTER_EXEC} sysctl -qw ${ROUTER_CONF}.disable_ipv6=0
 	${IP_ROUTER} addr add ${ROUTER_ADDR_WITH_MASK} dev ${ROUTER_INTF}
 
@@ -102,24 +115,39 @@ setup()
 }
 
 start_tcpdump() {
-	set -e
-	tcpdump_stdout=`mktemp`
-	tcpdump_stderr=`mktemp`
+	tcpdump_stdout=$(mktemp) || return 1
+	tcpdump_stderr=$(mktemp) || return 1
 	${IP_ROUTER_EXEC} timeout 15s \
                 tcpdump --immediate-mode -tpni ${ROUTER_INTF} -c 1 \
                 "icmp6 && icmp6[0] == 136 && src ${HOST_ADDR}" \
-                > ${tcpdump_stdout} 2> /dev/null
-	set +e
+                > "${tcpdump_stdout}" 2> "${tcpdump_stderr}" &
+	tcpdump_pid=$!
+
+	slowwait 5 grep -q "listening on ${ROUTER_INTF}" "${tcpdump_stderr}"
+}
+
+wait_tcpdump()
+{
+	local rc
+
+	wait "${tcpdump_pid}"
+	rc=$?
+	tcpdump_pid=
+
+	return "${rc}"
 }
 
 cleanup_tcpdump()
 {
-	set -e
-	[[ ! -z  ${tcpdump_stdout} ]] && rm -f ${tcpdump_stdout}
-	[[ ! -z  ${tcpdump_stderr} ]] && rm -f ${tcpdump_stderr}
+	if [ -n "${tcpdump_pid}" ]; then
+		kill "${tcpdump_pid}" 2> /dev/null
+		wait "${tcpdump_pid}" 2> /dev/null
+	fi
+	[ -n "${tcpdump_stdout}" ] && rm -f "${tcpdump_stdout}"
+	[ -n "${tcpdump_stderr}" ] && rm -f "${tcpdump_stderr}"
 	tcpdump_stdout=
 	tcpdump_stderr=
-	set +e
+	tcpdump_pid=
 }
 
 cleanup()
@@ -129,58 +157,145 @@ cleanup()
 	ip netns del ${ROUTER_NS}
 }
 
-link_up() {
-	set -e
+router_link_up()
+{
 	${IP_ROUTER} link set dev ${ROUTER_INTF} up
+}
+
+host_link_up()
+{
 	${IP_HOST} link set dev ${HOST_INTF} up
-	set +e
 }
 
 verify_ndisc() {
 	local drop_unsolicited_na=$1
 	local accept_untracked_na=$2
 	local forwarding=$3
+	local initial_state=${4:-absent}
+	local same_subnet=${5:-1}
+	local expected_lladdr
+	local neigh_show_output
+	local expected_state
+
+	if [ "${drop_unsolicited_na}" -eq 0 ] &&
+			[ "${forwarding}" -eq 1 ]; then
+		case "${accept_untracked_na}" in
+		1)
+			expected_state=STALE
+			expected_lladdr="${HOST_LLADDR}"
+			;;
+		2)
+			if [ "${same_subnet}" -eq 1 ]; then
+				expected_state=STALE
+				expected_lladdr="${HOST_LLADDR}"
+			fi
+			;;
+		esac
+	fi
+	if [ -z "${expected_state}" ] &&
+			[ "${initial_state}" = "failed" ]; then
+		expected_state=FAILED
+	fi
 
-	neigh_show_output=$(${IP_ROUTER} neigh show \
-                to ${HOST_ADDR} dev ${ROUTER_INTF} nud stale)
-	if [ ${drop_unsolicited_na} -eq 0 ] && \
-			[ ${accept_untracked_na} -eq 1 ] && \
-			[ ${forwarding} -eq 1 ]; then
-		# Neighbour entry expected to be present for 011 case
-		[[ ${neigh_show_output} ]]
+	if [ -n "${expected_state}" ]; then
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
+		if [[ " ${neigh_show_output} " != \
+				*" ${expected_state} "* ]]; then
+			return 1
+		fi
+		if [ -n "${expected_lladdr}" ] &&
+				[[ " ${neigh_show_output} " != \
+				*" lladdr ${expected_lladdr} "* ]]; then
+			return 1
+		fi
+		if [[ "${expected_state}" == "FAILED" &&
+		      "${neigh_show_output}" == *"lladdr"* ]]; then
+			return 1
+		fi
+		if [ "${initial_state}" = "failed" ]; then
+			[[ "${neigh_show_output}" == *"extern_learn"* ]]
+		fi
 	else
-		# Neighbour entry expected to be absent for all other cases
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
 		[[ -z ${neigh_show_output} ]]
 	fi
 }
 
 test_unsolicited_na_common()
 {
+	local same_subnet=${5:-1}
+	local neigh_show_output
+
+	if [ "${same_subnet}" -eq 1 ]; then
+		ROUTER_ADDR="${ROUTER_ADDR_IN_NETWORK}"
+	else
+		ROUTER_ADDR="${ROUTER_ADDR_OUT_OF_NETWORK}"
+	fi
+	ROUTER_ADDR_WITH_MASK="${ROUTER_ADDR}/${SUBNET_WIDTH}"
+
 	# Setup the test bed, but keep links down
-	setup $1 $2 $3
+	setup "$1" "$2" "$3"
+
+	if [ "${4:-absent}" = "failed" ]; then
+		if ! ${IP_ROUTER} neigh replace "${HOST_ADDR}" \
+				dev "${ROUTER_INTF}" \
+				nud failed extern_learn; then
+			echo "Unable to create NUD_FAILED neighbor entry"
+			return 1
+		fi
+		neigh_show_output=$(${IP_ROUTER} neigh show \
+			to "${HOST_ADDR}" dev "${ROUTER_INTF}")
+		if [[ " ${neigh_show_output} " != *" FAILED "* ]]; then
+			echo "Unable to verify NUD_FAILED neighbor entry"
+			return 1
+		fi
+		if [[ "${neigh_show_output}" != *"extern_learn"* ]]; then
+			echo "Neighbor entry is not externally learned"
+			return 1
+		fi
+	fi
 
-	# Bring the link up, wait for the NA,
-	# and add a delay to ensure neighbour processing is done.
-	link_up
-	start_tcpdump
+	# Arm the capture before bringing up the host and starting DAD.
+	router_link_up || return 1
+	start_tcpdump || return 1
+	host_link_up || return 1
+
+	# Closing tcpdump's packet socket calls synchronize_net(), so waiting
+	# for it also waits for receive processing of the captured NA.
+	wait_tcpdump || return 1
 
 	# Verify the neighbour table
-	verify_ndisc $1 $2 $3
+	verify_ndisc "$1" "$2" "$3" "$4" "${same_subnet}"
 
 }
 
 test_unsolicited_na_combination() {
-	test_unsolicited_na_common $1 $2 $3
+	local initial_state=${4:-absent}
+	local same_subnet=${5:-1}
+	local rc
+
+	test_unsolicited_na_common "$1" "$2" "$3" "${initial_state}" \
+		"${same_subnet}"
+	rc=$?
 	test_msg=("test_unsolicited_na: "
 		"drop_unsolicited_na=$1 "
 		"accept_untracked_na=$2 "
 		"forwarding=$3")
-	log_test $? 0 "${test_msg[*]}"
+	if [ "${initial_state}" = "failed" ]; then
+		test_msg+=("initial_state=failed")
+	fi
+	if [ "$2" -eq 2 ]; then
+		test_msg+=("same_subnet=${same_subnet}")
+	fi
+	log_test "${rc}" 0 "${test_msg[*]}"
 	cleanup
 }
 
 test_unsolicited_na_combinations() {
 	# Args: drop_unsolicited_na accept_untracked_na forwarding
+	#       [initial_state] [same_subnet]
 
 	# Expect entry
 	test_unsolicited_na_combination 0 1 1
@@ -193,6 +308,16 @@ test_unsolicited_na_combinations() {
 	test_unsolicited_na_combination 1 0 1
 	test_unsolicited_na_combination 1 1 0
 	test_unsolicited_na_combination 1 1 1
+
+	# Expect FAILED entry to become STALE
+	test_unsolicited_na_combination 0 1 1 failed
+	test_unsolicited_na_combination 0 2 1 failed 1
+
+	# Expect FAILED entry to remain FAILED
+	test_unsolicited_na_combination 0 0 1 failed
+	test_unsolicited_na_combination 0 1 0 failed
+	test_unsolicited_na_combination 1 1 1 failed
+	test_unsolicited_na_combination 0 2 1 failed 0
 }
 
 ###############################################################################
-- 
2.43.0

